import os
import argparse
import numpy as np
import cv2

import utils_and_methods as utils
from PIL import Image as PILImage

def perturb_and_save(dir: str, perturb: callable, lv: int):
    print("Processing input files...")
    images = utils.load_images_from_folder(dir)
    
    for i in range(len(images)):
        img = PILImage.fromarray(images[i])
        img = perturb(img, lv)
        img = np.array(img).astype(np.uint8)
        img = cv2.cvtColor(img, cv2.COLOR_RGB2GRAY)

        cv2.imwrite(os.path.join(SAVE_PATH, "%04i.png" % i), img)
            
        if (i % 200 == 0):    
            print("Saved %i / %i" % (i, len(images)))


SAVE_PATH = "/media/huanglab/HuangLab10TB/slam_team/dataset/Replica_robustness/"


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Read frames form file, apply perturbations, then publish to rostopic")
    parser.add_argument("folder_path",      help = "Input folder containing images.")     
    parser.add_argument("--method",      help = "method name (see script)", nargs = '?', default = "gaussian_blur")
    parser.add_argument("--severity",    help = "severity [1,5]",           nargs = '?', type = int, default = 1)

    args = parser.parse_args()
    dir = args.folder_path
    print("start_perturbation")
    d = {'gaussian_noise': utils.gaussian_noise, 
         'shot_noise': utils.shot_noise,
         'impulse_noise': utils.impulse_noise,
         'speckle_noise': utils.speckle_noise,
         'gaussian_blur': utils.gaussian_blur,
         'glass_blur': utils.glass_blur, 
         'defocus_blur': utils.defocus_blur,
         'fog': utils.fog,
         'frost': utils.frost,
         'contrast': utils.contrast, 
         'brightness': utils.brightness,
         'saturate': utils.saturate, 
         'zoom_blur': utils.zoom_blur,
         'motion_blur': utils.motion_blur,
         'snow': utils.snow,
         'spatter': utils.spatter, 
         'jpeg' : utils.jpeg_compression,
         'pixelate': utils.pixelate,
         'none': utils.none
         }
    
    if d.get(args.method) != None: 
        perturb = d[args.method]
    else:
        print("Invalid perturbation method. \n")

    print ("Images: %s \nPerturbation: %s %d" % 
           (dir, args.method, args.severity))
    
    traj_name = dir.split(os.sep)[-3]
    SAVE_PATH = os.path.join(SAVE_PATH, traj_name, args.method, str(args.severity))
    print("dataset_save_path",SAVE_PATH)
    if not os.path.exists(SAVE_PATH):
        os.makedirs(SAVE_PATH)
    
    perturb_and_save(dir, perturb, args.severity)