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
from torchvision import transforms
import numpy as np
import cv2
import matplotlib.pyplot as plt

def mse(img1, img2):
    return (((img1 - img2)) ** 2).view(img1.shape[0], -1).mean(1, keepdim=True)

def psnr(img1, img2):
    mse = (((img1 - img2)) ** 2).view(img1.shape[0], -1).mean(1, keepdim=True)
    return 20 * torch.log10(1.0 / torch.sqrt(mse))

to8b = lambda x : (255*np.clip(x,0,1)).astype(np.uint8)

def rgb2loftrgray(img, height=480, width=640):
    resizer = transforms.Resize([height,width])
    gray=transforms.functional.rgb_to_grayscale(img)
    img11 = resizer(gray)
    #img11 = gray
    img11 = img11[None].cuda()
    return img11


def normalize_to_01(lst):
    min_val = min(lst)
    max_val = max(lst)
    normalized = [(x - min_val) / (max_val - min_val) for x in lst]
    return normalized

def normalize_to_minus1_1(lst):
    min_val = min(lst)
    max_val = max(lst)
    normalized = [2 * ((x - min_val) / (max_val - min_val)) - 1 for x in lst]
    return normalized

def rgb_to_bgr(rgb_color):
    return (rgb_color[2], rgb_color[1], rgb_color[0])


def draw_matches(q_img, r_img, x1, y1, x2, y2, mconf,  height, width):
    # Convert torch tensors to NumPy arrays and then to BGR format for OpenCV
    resizer = transforms.Resize([height,width])
    q_img = resizer(q_img)
    r_img = resizer(r_img)
    q_img_np = to8b(q_img.permute(1, 2, 0).detach().cpu().numpy())
    r_img_np = to8b(r_img.permute(1, 2, 0).detach().cpu().numpy())
    q_img_bgr = cv2.cvtColor(q_img_np, cv2.COLOR_RGB2BGR)
    r_img_bgr = cv2.cvtColor(r_img_np, cv2.COLOR_RGB2BGR)

    # Create an empty image with the same height as input images and double the width
    combined_img = np.zeros((q_img_bgr.shape[0], q_img_bgr.shape[1] * 2, 3), dtype=np.uint8)
    

    # Place images side by side
    combined_img[:, :q_img_bgr.shape[1]] = q_img_bgr
    combined_img[:, q_img_bgr.shape[1]:] = r_img_bgr
    mconf = mconf.cpu().detach().numpy()

    # Define a colormap for visualizing confidence
    colormap = plt.cm.get_cmap('RdYlGn') #('RdYlGn') #('plasma')
    # Draw matched points and lines
    for i in range(mconf.shape[0]):
        pt1 = (int(x1[i]), int(y1[i]))
        pt2 = (int(x2[i] + q_img_bgr.shape[1]), int(y2[i]))  # Offset by image width
        conf = mconf[i]
        color = np.array(colormap(conf)[:3]) * 255  # Convert to BGR color space
        color = color[::-1]
        
        # Draw circles at matched points
        cv2.circle(combined_img, pt1, 3, color.astype(np.uint8).tolist(), -1)
        cv2.circle(combined_img, pt2, 3, color.astype(np.uint8).tolist(), -1)
        
        # Draw line connecting matched points with intensity based on confidence
        intensity = int(conf * 255)
        cv2.line(combined_img, pt1, pt2, color.astype(np.uint8).tolist(), 1)

    cv2.namedWindow('Matched Points', cv2.WINDOW_NORMAL)        
    cv2.imshow('Matched Points', combined_img)
    cv2.waitKey(0)
    cv2.destroyAllWindows()
    return combined_img





def visualize_alignment(P1, P2, R, t, title_text=''):
    """
    Visualize the alignment of points P2 with respect to P1 using the predicted rotation matrix R and translation vector t.

    Args:
    - P1: numpy array of shape (N, 3) representing 3D points in view 1
    - P2: numpy array of shape (N, 3) representing 3D points in view 2
    - R: numpy array of shape (3, 3) representing rotation matrix from view 1 to view 2
    - t: numpy array of shape (3, 1) representing translation vector from view 1 to view 2
    - title_text: title of plot
    """

    # Apply the rotation and translation to P2
    P2_aligned = (R @ P1.transpose(1,0)).T + t.flatten() # P2.T

    print("total error:",(P2_aligned - P2).sum())

    # Plotting
    # Setting global font parameters
    plt.rcParams.update({ 'font.size': 10})

    # Create figure and subplots
    fig, axs = plt.subplots(2, 2, figsize=(12, 18), subplot_kw={'projection': '3d'})

    # Adjust spacing between subplots
    fig.subplots_adjust(hspace=0.1, wspace=0.1)

    # Iterate over each subplot and plot data
    for i in range(2):
        for j in range(2):
            ax = axs[i, j]

            # Plot original points P1 and P2 with legends
            ax.scatter(P1[:, 0], P1[:, 1], P1[:, 2], color='b', marker='o', label='Rendered 3D Points')
            ax.scatter(P2[:, 0], P2[:, 1], P2[:, 2], color='g', marker='^', label='Observed 3D Points')
            ax.scatter(P2_aligned[:, 0], P2_aligned[:, 1], P2_aligned[:, 2], color='r', marker='s', label='Rendered 3D Points After Alignment')

            # Plot connections between original P2 and aligned P2 points
            for k in range(len(P2)):
                if k == 0:
                    ax.plot([P2_aligned[k, 0], P1[k, 0]],
                            [P2_aligned[k, 1], P1[k, 1]],
                            [P2_aligned[k, 2], P1[k, 2]], color='orange', label='Correspondence')
                else:
                    ax.plot([P2_aligned[k, 0], P1[k, 0]],
                            [P2_aligned[k, 1], P1[k, 1]],
                            [P2_aligned[k, 2], P1[k, 2]], color='orange')
            ax.set_xlabel('X')
            ax.set_ylabel('Y')
            ax.set_zlabel('Z')
            ax.set_title(f'{title_text}')
            ax.legend(ncol = 2)

            # Set different view angles for each subplot
            ax.view_init(elev=30, azim=45*(2*i+j))
    plt.show()
