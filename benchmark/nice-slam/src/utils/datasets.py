import glob
import os

import cv2
import numpy as np
import torch
import torch.nn.functional as F
from src.common import as_intrinsics_matrix
from torch.utils.data import Dataset
from .robustness import brightness,contrast,spatter,zoom_blur,motion_blur,defocus_blur,gaussian_noise,shot_noise,impulse_noise,speckle_noise,gaussian_blur,glass_blur,fog,frost,snow,jpeg_compression,pixelate,gaussian_noise_strong
from .robustness_depth import depth_add_random_mask, depth_add_fixed_mask, depth_add_edge_erosion, depth_add_gaussian_noise, depth_range
from PIL import Image
import random


def readEXR_onlydepth(filename):
    """
    Read depth data from EXR image file.

    Args:
        filename (str): File path.

    Returns:
        Y (numpy.array): Depth buffer in float32 format.
    """
    # move the import here since only CoFusion needs these package
    # sometimes installation of openexr is hard, you can run all other datasets
    # even without openexr
    import Imath
    import OpenEXR as exr

    exrfile = exr.InputFile(filename)
    header = exrfile.header()
    dw = header['dataWindow']
    isize = (dw.max.y - dw.min.y + 1, dw.max.x - dw.min.x + 1)

    channelData = dict()

    for c in header['channels']:
        C = exrfile.channel(c, Imath.PixelType(Imath.PixelType.FLOAT))
        C = np.fromstring(C, dtype=np.float32)
        C = np.reshape(C, isize)

        channelData[c] = C

    Y = None if 'Y' not in header['channels'] else channelData['Y']

    return Y


def get_dataset(cfg, args, scale, device='cuda:0'):
    return dataset_dict[cfg['dataset']](cfg, args, scale, device=device)


class BaseDataset(Dataset):
    def __init__(self, cfg, args, scale, device='cuda:0'
                 ):
        super(BaseDataset, self).__init__()
        self.name = cfg['dataset']
        self.device = device
        self.scale = scale
        self.png_depth_scale = cfg['cam']['png_depth_scale']

        self.H, self.W, self.fx, self.fy, self.cx, self.cy = cfg['cam']['H'], cfg['cam'][
            'W'], cfg['cam']['fx'], cfg['cam']['fy'], cfg['cam']['cx'], cfg['cam']['cy']

        self.distortion = np.array(
            cfg['cam']['distortion']) if 'distortion' in cfg['cam'] else None
        self.crop_size = cfg['cam']['crop_size'] if 'crop_size' in cfg['cam'] else None

        if args.input_folder is None:
            self.input_folder = cfg['data']['input_folder']
        else:
            self.input_folder = args.input_folder

        self.crop_edge = cfg['cam']['crop_edge']

        self.perturb_type = 17
        self.perturb_severity=0
        self.perturb_dynamic = 0
        self.trainskip = 1
        if 'robustness' in cfg.keys():
            self.perturb_type = cfg['robustness']['perturb_type']
            self.perturb_severity = cfg['robustness']['perturb_severity']
            self.perturb_dynamic = cfg['robustness']['perturb_dynamic']
            print("#############################################################")
            print("self.perturb_type",self.perturb_type)
            print("self.perturb_severity",self.perturb_severity)
            print("self.perturb_dynamic",self.perturb_dynamic)
            if 'trainskip' in cfg['robustness'].keys():
                self.trainskip=cfg['robustness']['trainskip']
                print("self.trainskip", self.trainskip)
                print("Trainskip only support Replica dataset now!!!")

    def __len__(self):
        return self.n_img

    def __getitem__(self, index):
        color_path = self.color_paths[index * self.trainskip]

        if self.perturb_type == 18:
            if self.perturb_dynamic > 0:
                # If dynamic perturbation is enabled, select a random delay within a range
                min_delay = self.perturb_severity - self.perturb_dynamic
                max_delay = self.perturb_severity + self.perturb_dynamic
                # Make sure the min_delay is not negative
                min_delay = max(0, min_delay)
                delay = random.randint(min_delay, max_delay)
            else:
                # Static delay
                delay = self.perturb_severity

            depth_index = max(0, min(index - delay, self.n_img - 1))  # Ensure depth_index is within valid range
        else:
            depth_index = index

        depth_path = self.depth_paths[depth_index * self.trainskip]  # Apply offset to depth index
        #depth_path = self.depth_paths[index*self.trainskip]

        color_data = cv2.imread(color_path)
        if '.png' in depth_path:
            depth_data = cv2.imread(depth_path, cv2.IMREAD_UNCHANGED)
        elif '.exr' in depth_path:
            depth_data = readEXR_onlydepth(depth_path)
        if self.distortion is not None:
            K = as_intrinsics_matrix([self.fx, self.fy, self.cx, self.cy])
            # undistortion is only applied on color image, not depth!
            color_data = cv2.undistort(color_data, K, self.distortion)

        
        color_data = cv2.cvtColor(color_data, cv2.COLOR_BGR2RGB)

        # robustness evaluation
        color_data = Image.fromarray(color_data)
        #print("self.perturb_type",self.perturb_type)
        #print("self.perturb_severity",self.perturb_severity)
        #print("self.perturb_type",type(self.perturb_type))
        #print("self.perturb_severity",type(self.perturb_severity))

        if self.perturb_dynamic > 0:
            print("dynamic perturbation")
            rnd_severity = random.choice([0, 1, 2, 3, 4, 5])
            if rnd_severity > 0:
                perturb_type = self.perturb_type
                perturb_severity = rnd_severity
            else:
                perturb_type = 17 # no perturbation
                perturb_severity = self.perturb_severity
            print("dyn_perturb: "+ str(perturb_type) + "_" + str(perturb_severity))
        else:
            perturb_type = self.perturb_type
            perturb_severity = self.perturb_severity

        if perturb_type == 0:
            color_data = brightness(color_data,perturb_severity)
        elif perturb_type == 1:
            color_data = contrast(color_data,perturb_severity)
        elif perturb_type == 2:
            color_data = spatter(color_data,perturb_severity)
        elif perturb_type == 3:
            color_data = zoom_blur(color_data,perturb_severity)
        elif perturb_type == 4:
            color_data = motion_blur(color_data,perturb_severity)
        elif perturb_type == 5:
            color_data = defocus_blur(color_data,perturb_severity)
        elif perturb_type == 6:
            color_data = gaussian_noise(color_data,perturb_severity)
        elif perturb_type == 7:
            color_data = shot_noise(color_data,perturb_severity)
        elif perturb_type == 8:
            color_data = impulse_noise(color_data,perturb_severity)
        elif perturb_type == 9:
            color_data = speckle_noise(color_data,perturb_severity)
        elif perturb_type == 10:
            color_data = gaussian_blur(color_data,perturb_severity)
        elif perturb_type == 11:
            color_data = glass_blur(color_data,perturb_severity)
        elif perturb_type == 12:
            color_data = fog(color_data,perturb_severity)
        elif perturb_type == 13:
            color_data = frost(color_data,perturb_severity)
        elif perturb_type == 14:
            color_data = snow(color_data,perturb_severity)
        elif perturb_type == 15:
            color_data = jpeg_compression(color_data,perturb_severity)
        elif perturb_type == 16:
            color_data = pixelate(color_data,perturb_severity)
        elif perturb_type == 17:
            pass
        elif perturb_type == 20:
            depth_data = depth_add_gaussian_noise(depth_data, perturb_severity)
        elif perturb_type == 21:
            depth_data = depth_add_edge_erosion(depth_data, perturb_severity)
        elif perturb_type == 22:
            depth_data = depth_add_random_mask(depth_data, perturb_severity)
        elif perturb_type == 23:
            depth_data = depth_add_fixed_mask(depth_data, perturb_severity)
        elif perturb_type >= 25:
            pass

        color_data = np.array(color_data)
        color_data = color_data[:, :, ::-1]

        color_data = color_data / 255.
        depth_data = depth_data.astype(np.float32) / self.png_depth_scale
        if perturb_type == 24:
            depth_data = depth_range(depth_data,perturb_severity)
        H, W = depth_data.shape

        color_data = cv2.resize(color_data, (W, H))

        color_data = torch.from_numpy(color_data)
        depth_data = torch.from_numpy(depth_data)*self.scale

        if self.crop_size is not None:
            # follow the pre-processing step in lietorch, actually is resize
            color_data = color_data.permute(2, 0, 1)
            color_data = F.interpolate(
                color_data[None], self.crop_size, mode='bilinear', align_corners=True)[0]
            depth_data = F.interpolate(
                depth_data[None, None], self.crop_size, mode='nearest')[0, 0]
            color_data = color_data.permute(1, 2, 0).contiguous()

        edge = self.crop_edge
        if edge > 0:
            # crop image edge, there are invalid value on the edge of the color image
            color_data = color_data[edge:-edge, edge:-edge]
            depth_data = depth_data[edge:-edge, edge:-edge]
        pose = self.poses[index]
        pose[:3, 3] *= self.scale
        return index, color_data.to(self.device), depth_data.to(self.device), pose.to(self.device)


class Replica(BaseDataset):
    def __init__(self, cfg, args, scale, device='cuda:0'
                 ):
        super(Replica, self).__init__(cfg, args, scale, device)
        self.color_paths = sorted(
            glob.glob(f'{self.input_folder}/results/frame*.jpg'))
        self.depth_paths = sorted(
            glob.glob(f'{self.input_folder}/results/depth*.png'))
        #self.n_img = len(self.color_paths)
        self.frame_ids = range(0, len(self.color_paths), self.trainskip)
        self.n_img = len(self.frame_ids)
        self.load_poses(f'{self.input_folder}/traj.txt')

    def load_poses(self, path):
        self.poses = []
        with open(path, "r") as f:
            lines = f.readlines()
        for i in range(self.n_img*self.trainskip):
            line = lines[i]
            c2w = np.array(list(map(float, line.split()))).reshape(4, 4)
            c2w[:3, 1] *= -1
            c2w[:3, 2] *= -1
            c2w = torch.from_numpy(c2w).float()
            if self.trainskip ==1:
                self.poses.append(c2w)
            elif i % self.trainskip:
                self.poses.append(c2w)


class Azure(BaseDataset):
    def __init__(self, cfg, args, scale, device='cuda:0'
                 ):
        super(Azure, self).__init__(cfg, args, scale, device)
        self.color_paths = sorted(
            glob.glob(os.path.join(self.input_folder, 'color', '*.jpg')))
        self.depth_paths = sorted(
            glob.glob(os.path.join(self.input_folder, 'depth', '*.png')))
        self.n_img = len(self.color_paths)
        self.load_poses(os.path.join(
            self.input_folder, 'scene', 'trajectory.log'))

    def load_poses(self, path):
        self.poses = []
        if os.path.exists(path):
            with open(path) as f:
                content = f.readlines()

                # Load .log file.
                for i in range(0, len(content), 5):
                    # format %d (src) %d (tgt) %f (fitness)
                    data = list(map(float, content[i].strip().split(' ')))
                    ids = (int(data[0]), int(data[1]))
                    fitness = data[2]

                    # format %f x 16
                    c2w = np.array(
                        list(map(float, (''.join(
                            content[i + 1:i + 5])).strip().split()))).reshape((4, 4))

                    c2w[:3, 1] *= -1
                    c2w[:3, 2] *= -1
                    c2w = torch.from_numpy(c2w).float()
                    self.poses.append(c2w)
        else:
            for i in range(self.n_img):
                c2w = np.eye(4)
                c2w = torch.from_numpy(c2w).float()
                self.poses.append(c2w)


class ScanNet(BaseDataset):
    def __init__(self, cfg, args, scale, device='cuda:0'
                 ):
        super(ScanNet, self).__init__(cfg, args, scale, device)
        self.input_folder = os.path.join(self.input_folder, 'frames')
        self.color_paths = sorted(glob.glob(os.path.join(
            self.input_folder, 'color', '*.jpg')), key=lambda x: int(os.path.basename(x)[:-4]))
        self.depth_paths = sorted(glob.glob(os.path.join(
            self.input_folder, 'depth', '*.png')), key=lambda x: int(os.path.basename(x)[:-4]))
        self.load_poses(os.path.join(self.input_folder, 'pose'))
        self.n_img = len(self.color_paths)

    def load_poses(self, path):
        self.poses = []
        pose_paths = sorted(glob.glob(os.path.join(path, '*.txt')),
                            key=lambda x: int(os.path.basename(x)[:-4]))
        for pose_path in pose_paths:
            with open(pose_path, "r") as f:
                lines = f.readlines()
            ls = []
            for line in lines:
                l = list(map(float, line.split(' ')))
                ls.append(l)
            c2w = np.array(ls).reshape(4, 4)
            c2w[:3, 1] *= -1
            c2w[:3, 2] *= -1
            c2w = torch.from_numpy(c2w).float()
            self.poses.append(c2w)


class CoFusion(BaseDataset):
    def __init__(self, cfg, args, scale, device='cuda:0'
                 ):
        super(CoFusion, self).__init__(cfg, args, scale, device)
        self.input_folder = os.path.join(self.input_folder)
        self.color_paths = sorted(
            glob.glob(os.path.join(self.input_folder, 'colour', '*.png')))
        self.depth_paths = sorted(glob.glob(os.path.join(
            self.input_folder, 'depth_noise', '*.exr')))
        self.n_img = len(self.color_paths)
        self.load_poses(os.path.join(self.input_folder, 'trajectories'))

    def load_poses(self, path):
        # We tried, but cannot align the coordinate frame of cofusion to ours.
        # So here we provide identity matrix as proxy.
        # But it will not affect the calculation of ATE since camera trajectories can be aligned.
        self.poses = []
        for i in range(self.n_img):
            c2w = np.eye(4)
            c2w = torch.from_numpy(c2w).float()
            self.poses.append(c2w)


class TUM_RGBD(BaseDataset):
    def __init__(self, cfg, args, scale, device='cuda:0'
                 ):
        super(TUM_RGBD, self).__init__(cfg, args, scale, device)
        self.color_paths, self.depth_paths, self.poses = self.loadtum(
            self.input_folder, frame_rate=32)
        self.n_img = len(self.color_paths)

    def parse_list(self, filepath, skiprows=0):
        """ read list data """
        data = np.loadtxt(filepath, delimiter=' ',
                          dtype=np.unicode_, skiprows=skiprows)
        return data

    def associate_frames(self, tstamp_image, tstamp_depth, tstamp_pose, max_dt=0.08):
        """ pair images, depths, and poses """
        associations = []
        for i, t in enumerate(tstamp_image):
            if tstamp_pose is None:
                j = np.argmin(np.abs(tstamp_depth - t))
                if (np.abs(tstamp_depth[j] - t) < max_dt):
                    associations.append((i, j))

            else:
                j = np.argmin(np.abs(tstamp_depth - t))
                k = np.argmin(np.abs(tstamp_pose - t))

                if (np.abs(tstamp_depth[j] - t) < max_dt) and \
                        (np.abs(tstamp_pose[k] - t) < max_dt):
                    associations.append((i, j, k))

        return associations

    def loadtum(self, datapath, frame_rate=-1):
        """ read video data in tum-rgbd format """
        if os.path.isfile(os.path.join(datapath, 'groundtruth.txt')):
            pose_list = os.path.join(datapath, 'groundtruth.txt')
        elif os.path.isfile(os.path.join(datapath, 'pose.txt')):
            pose_list = os.path.join(datapath, 'pose.txt')

        image_list = os.path.join(datapath, 'rgb.txt')
        depth_list = os.path.join(datapath, 'depth.txt')

        image_data = self.parse_list(image_list)
        depth_data = self.parse_list(depth_list)
        pose_data = self.parse_list(pose_list, skiprows=1)
        pose_vecs = pose_data[:, 1:].astype(np.float64)

        tstamp_image = image_data[:, 0].astype(np.float64)
        tstamp_depth = depth_data[:, 0].astype(np.float64)
        tstamp_pose = pose_data[:, 0].astype(np.float64)
        associations = self.associate_frames(
            tstamp_image, tstamp_depth, tstamp_pose)

        indicies = [0]
        for i in range(1, len(associations)):
            t0 = tstamp_image[associations[indicies[-1]][0]]
            t1 = tstamp_image[associations[i][0]]
            if t1 - t0 > 1.0 / frame_rate:
                indicies += [i]

        images, poses, depths, intrinsics = [], [], [], []
        inv_pose = None
        for ix in indicies:
            (i, j, k) = associations[ix]
            images += [os.path.join(datapath, image_data[i, 1])]
            depths += [os.path.join(datapath, depth_data[j, 1])]
            c2w = self.pose_matrix_from_quaternion(pose_vecs[k])
            if inv_pose is None:
                inv_pose = np.linalg.inv(c2w)
                c2w = np.eye(4)
            else:
                c2w = inv_pose@c2w
            c2w[:3, 1] *= -1
            c2w[:3, 2] *= -1
            c2w = torch.from_numpy(c2w).float()
            poses += [c2w]

        return images, depths, poses

    def pose_matrix_from_quaternion(self, pvec):
        """ convert 4x4 pose matrix to (t, q) """
        from scipy.spatial.transform import Rotation

        pose = np.eye(4)
        pose[:3, :3] = Rotation.from_quat(pvec[3:]).as_matrix()
        pose[:3, 3] = pvec[:3]
        return pose


dataset_dict = {
    "replica": Replica,
    "scannet": ScanNet,
    "cofusion": CoFusion,
    "azure": Azure,
    "tumrgbd": TUM_RGBD
}
