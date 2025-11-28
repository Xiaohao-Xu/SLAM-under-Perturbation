#
# Copyright (C) 2023, Inria
# GRAPHDECO research group, https://team.inria.fr/graphdeco
# All rights reserved.
#
# This software is free for non-commercial, research and evaluation use 
# under the terms of the LICENSE.md file.
#
# For inquiries contact  george.drettakis@inria.fr
#

import torch
import torch.nn.functional as F
from torch.autograd import Variable
from math import exp
from utils_match.image_utils import rgb2loftrgray, draw_matches
import numpy as np
import time


def l1_loss(network_output, gt):
    return torch.abs((network_output - gt)).mean()

def l2_loss(network_output, gt):
    return ((network_output - gt) ** 2).mean()

def loss_mse(reder_img,gt):
    loss_fn = torch.nn.MSELoss()
    loss2 = loss_fn(reder_img,gt)
    return loss2



def loss_loftr(q_img,r_img,matcher,threshold,min_num_points, vis=False, use_sel_top_corr=False,use_half_precision=False):
    if use_half_precision:
        height = 480 #680 # 480 #480
        width  = 640 #1200 # 640 #640  
    else:
        height =  680 # 480 #480
        width  = 1200 # 640 #640

    q_img_gray = rgb2loftrgray(q_img, height, width)
    r_img_gray = rgb2loftrgray(r_img, height, width)

    if use_half_precision:
        batch = {'image0':q_img_gray.half(), 'image1':r_img_gray.half()}    
    else:
        batch = {'image0':q_img_gray, 'image1':r_img_gray}
    
    matcher(batch) 

    mkpts0 = batch['mkpts0_f']
    mkpts1 = batch['mkpts1_f']
    mconf = batch['mconf']



    if use_sel_top_corr:
        sorted_pairs = sorted(enumerate(mconf), key=lambda x: x[1], reverse = True)
        indices = [pair[0] for pair in sorted_pairs[:6]]
    else:
        # Select a subset of matching points with higher confidence.
        indices = torch.nonzero(mconf > threshold).squeeze()

        count = indices.numel()
        if count < min_num_points:
            return None

    corr_conf = mconf[indices]

    x1 = mkpts0[indices, 0] 
    y1 = mkpts0[indices, 1] 
    x2 = mkpts1[indices, 0]  
    y2 = mkpts1[indices, 1] 

    sorted_indices = torch.argsort(corr_conf, descending=False)
    corr_conf = corr_conf[sorted_indices]

    x1 = x1[sorted_indices]
    y1 = y1[sorted_indices]
    x2 = x2[sorted_indices]
    y2 = y2[sorted_indices]

    if vis == True:
        draw_matches(q_img, r_img, x1, y1, x2, y2, corr_conf, height, width)

    x1 = x1 / width 
    y1 = y1 / height
    x2 = x2 / width 
    y2 = y2 / height

    error_i = (x1 - x2) ** 2 + (y1 - y2) ** 2 
    error_i = error_i.float().cuda()          
    loss = torch.sum(error_i) / len(indices)      

    width_org = q_img.size()[-1] # 1200
    height_org = q_img.size()[-2] # 680

    normalized_corr = [x1 * width_org,
                       y1 * height_org,
                       x2 * width_org,
                       y2 * height_org,
                       corr_conf]

    return loss, normalized_corr

def gaussian(window_size, sigma):
    gauss = torch.Tensor([exp(-(x - window_size // 2) ** 2 / float(2 * sigma ** 2)) for x in range(window_size)])
    return gauss / gauss.sum()

def create_window(window_size, channel):
    _1D_window = gaussian(window_size, 1.5).unsqueeze(1)
    _2D_window = _1D_window.mm(_1D_window.t()).float().unsqueeze(0).unsqueeze(0)
    window = Variable(_2D_window.expand(channel, 1, window_size, window_size).contiguous())
    return window

def ssim(img1, img2, window_size=11, size_average=True):
    channel = img1.size(-3)
    window = create_window(window_size, channel)

    if img1.is_cuda:
        window = window.cuda(img1.get_device())
    window = window.type_as(img1)

    return _ssim(img1, img2, window, window_size, channel, size_average)

def _ssim(img1, img2, window, window_size, channel, size_average=True):
    mu1 = F.conv2d(img1, window, padding=window_size // 2, groups=channel)
    mu2 = F.conv2d(img2, window, padding=window_size // 2, groups=channel)

    mu1_sq = mu1.pow(2)
    mu2_sq = mu2.pow(2)
    mu1_mu2 = mu1 * mu2

    sigma1_sq = F.conv2d(img1 * img1, window, padding=window_size // 2, groups=channel) - mu1_sq
    sigma2_sq = F.conv2d(img2 * img2, window, padding=window_size // 2, groups=channel) - mu2_sq
    sigma12 = F.conv2d(img1 * img2, window, padding=window_size // 2, groups=channel) - mu1_mu2

    C1 = 0.01 ** 2
    C2 = 0.03 ** 2

    ssim_map = ((2 * mu1_mu2 + C1) * (2 * sigma12 + C2)) / ((mu1_sq + mu2_sq + C1) * (sigma1_sq + sigma2_sq + C2))

    if size_average:
        return ssim_map.mean()
    else:
        return ssim_map.mean(1).mean(1).mean(1)

