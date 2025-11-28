import argparse
import random

import numpy as np
import torch

from src import config
from src.NICE_SLAM import NICE_SLAM


def setup_seed(seed):
    torch.manual_seed(seed)
    torch.cuda.manual_seed_all(seed)
    np.random.seed(seed)
    random.seed(seed)
    torch.backends.cudnn.deterministic = True


def main():
    # setup_seed(20)

    parser = argparse.ArgumentParser(
        description='Arguments for running the NICE-SLAM/iMAP*.'
    )
    parser.add_argument('config', type=str, help='Path to config file.')
    parser.add_argument('--input_folder', type=str,
                        help='input folder, this have higher priority, can overwrite the one in config file')
    parser.add_argument('--output', type=str,
                        help='output folder, this have higher priority, can overwrite the one in config file')
    nice_parser = parser.add_mutually_exclusive_group(required=False)
    nice_parser.add_argument('--nice', dest='nice', action='store_true')
    nice_parser.add_argument('--imap', dest='nice', action='store_false')

    parser.add_argument('--sanity', type=int, default=0,
                        help='use_sanity setting for quick test')

    parser.add_argument('--perturb_type', type=int, default=17,
                        help='')
    parser.add_argument('--perturb_severity', type=int, default=0,
                        help='')
    parser.add_argument('--perturb_dynamic', type=int, default=0,
                        help='')
    parser.add_argument('--frame_downsample', type=int, default=1,
                        help='')

    parser.set_defaults(nice=True)
    args = parser.parse_args()
    
    if args.sanity == 0: 
        cfg = config.load_config(
            args.config, 'configs/nice_slam.yaml' if args.nice else 'configs/imap.yaml')
    else:
        print("use sanity test")
        cfg = config.load_config(
            args.config, 'configs/nice_slam_sanity.yaml' if args.nice else 'configs/imap_sanity.yaml')
    if args.nice:
        pass
    else:
        cfg['data']['output'] = cfg['data']['output']+"_imap"
    if args.input_folder is not None:
        cfg['data']['input_folder'] = args.input_folder

    cfg['robustness']=dict([])
    cfg['robustness']['perturb_type'] = args.perturb_type
    cfg['robustness']['perturb_severity'] = args.perturb_severity
    cfg['robustness']['perturb_dynamic'] = args.perturb_dynamic
    cfg['robustness']['trainskip']=args.frame_downsample
    if args.output is not None:
        cfg['data']['output'] = args.output
    else:
        cfg['data']['output'] = cfg['data']['output'] + "_" + str(args.perturb_type) + "_" +str(args.perturb_severity) + "_" +str(args.perturb_dynamic)+"_"+str(args.frame_downsample)
    print(cfg)
    slam = NICE_SLAM(cfg, args)

    slam.run()


if __name__ == '__main__':
    main()
