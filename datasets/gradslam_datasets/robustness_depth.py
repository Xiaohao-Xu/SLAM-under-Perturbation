# -*- coding: utf-8 -*-

import numpy as np
import cv2
import warnings
import random

warnings.simplefilter("ignore", UserWarning)

def depth_add_gaussian_noise(x, severity=1):
    c = [0.1, 0.2, 0.3, 0.4, 0.5][severity - 1]
    mean, std = np.mean(x) * c, np.std(x) * c
    noise = np.random.normal(mean, std, x.shape).astype('uint16')
    noisy_image = x + noise
    return noisy_image

def depth_add_edge_erosion(x, severity=1):
    c = [(0.015, 3), (0.020, 3), (0.025, 3), (0.03, 3), (0.035, 3)][severity - 1]
    random_rate, patch_len = c
    scaled_x = cv2.normalize(x, None, 0, 255, cv2.NORM_MINMAX).astype(np.uint8)
    edges = cv2.Canny(scaled_x, 20, 50)
    edge_indices = np.column_stack(np.where(edges > 0))
    np.random.shuffle(edge_indices)
    erosion_edge_count = int(len(edge_indices) * random_rate)
    erosion_edge_indices = edge_indices[:erosion_edge_count]
    erosion_mask = edges.astype(bool)

    for pixel in erosion_edge_indices:
        x_range = slice(max(pixel[0] - patch_len, 0), min(pixel[0] + patch_len + 1, edges.shape[0]))
        y_range = slice(max(pixel[1] - patch_len, 0), min(pixel[1] + patch_len + 1, edges.shape[1]))
        erosion_mask[x_range, y_range] = True

    filled_map = np.full(x.shape, 0, dtype=np.uint16)
    noisy_image = np.copy(x)
    noisy_image[erosion_mask] = noisy_image[erosion_mask] * filled_map[erosion_mask]

    return noisy_image

def depth_add_random_mask(x, severity=1):
    c = [10, 15, 20, 25, 30][severity - 1]
    num_rectangles = 10
    scale = 0.1
    patch_w = int(x.shape[0] * scale)
    patch_h = int(x.shape[1] * scale)
    mask = np.zeros_like(x, dtype=bool)
    start_point = []
    sampled_num = 0
    while sampled_num < num_rectangles:
        x1, y1 = np.random.randint(0, x.shape[0] - patch_w), np.random.randint(0, x.shape[1] - patch_h)
        if sampled_num == 0:
            start_point.append((x1, y1))
        else:
            for point in start_point:
                if np.abs(point[0] - x1) < patch_w or np.abs(point[1] - y1) < patch_h:
                    continue
                else:
                    start_point.append((x1, y1))
        mask[x1:x1 + patch_w, y1:y1 + patch_h] = True
        sampled_num += 1
    filled_map = np.full(x.shape, 0, dtype=np.uint16)
    noisy_image = np.copy(x)
    filled_map[~mask] = 1
    noisy_image = noisy_image * filled_map
    return noisy_image

def depth_add_fixed_mask(x, severity=1):
    c = [5, 7, 9, 11, 13][severity - 1]
    scale = 0.1
    patch_w = int(x.shape[0] * scale)
    patch_h = int(x.shape[1] * scale)
    mask = np.zeros_like(x, dtype=bool)
    start_point = [(1, 1), (3, 1), (5, 1), (7, 1), (1, 3), (1, 5), (1, 7), (3, 3), (5, 5), (9, 9), (9, 1), (1, 9),
                   (7, 7)][:c]
    for i in range(c):
        x1, y1 = (start_point[i][0] - 1) * patch_w, (start_point[i][1] - 1) * patch_h
        x2, y2 = x1 + patch_w, y1 + patch_h
        mask[x1:x2, y1:y2] = True
    filled_map = np.full(x.shape, 0, dtype=np.uint16)
    noisy_image = np.copy(x)
    filled_map[~mask] = 1
    noisy_image = noisy_image * filled_map
    return noisy_image
    
def depth_range(x, severity=1):
    c = [(0.2, 4.4), (0.3, 4.2), (0.4, 4.0), (0.5, 3.8), (0.6, 3.6)][severity - 1]
    min_val, max_val = c
    mask = (x > max_val) | (x < min_val)
    filtered_image = np.where(mask, 0, x)
    return filtered_image




