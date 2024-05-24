import glob
import os
import cv2
import torch
import torch.nn.functional as F
import numpy as np
from scipy.spatial.transform import Rotation
from torch.utils.data import Dataset
from .utils import get_camera_rays, alphanum_key, as_intrinsics_matrix
from .robustness import brightness,contrast,spatter,zoom_blur,motion_blur,defocus_blur,gaussian_noise,shot_noise,impulse_noise,speckle_noise,gaussian_blur,glass_blur,fog,frost,snow,jpeg_compression,pixelate,gaussian_noise_strong
from .robustness_depth import depth_add_random_mask, depth_add_fixed_mask, depth_add_edge_erosion, depth_add_gaussian_noise, depth_range
from PIL import Image
import random

def quaternion_to_matrix(input_array):
    # Unpack the input array
    x, y, z, q0, q1, q2, q3 = input_array
    
    # Normalize the quaternion
    norm = np.sqrt(q0**2 + q1**2 + q2**2 + q3**2)
    q0 /= norm
    q1 /= norm
    q2 /= norm
    q3 /= norm
    
    # Create the rotation matrix
    rotation_matrix = np.array([
        [1 - 2*(q2**2 + q3**2), 2*(q1*q2 - q0*q3), 2*(q0*q2 + q1*q3), 0],
        [2*(q1*q2 + q0*q3), 1 - 2*(q1**2 + q3**2), 2*(q2*q3 - q0*q1), 0],
        [2*(q1*q3 - q0*q2), 2*(q0*q1 + q2*q3), 1 - 2*(q1**2 + q2**2), 0],
        [0, 0, 0, 1]
    ])

    # Create the translation matrix
    translation_matrix = np.array([
        [1, 0, 0, x],
        [0, 1, 0, y],
        [0, 0, 1, z],
        [0, 0, 0, 1]
    ])
    
    # Combine the rotation and translation matrices
    transformation_matrix = np.dot(translation_matrix, rotation_matrix)
    
    return transformation_matrix

def get_dataset(config):
    '''
    Get the dataset class from the config file.
    '''
    if config['dataset'] == 'replica':
        dataset = ReplicaDataset
    
    elif config['dataset'] == 'scannet':
        dataset = ScannetDataset
    
    elif config['dataset'] == 'synthetic':
        dataset = RGBDataset
    
    elif config['dataset'] == 'tum':
        dataset = TUMDataset
    
    elif config['dataset'] == 'azure':
        dataset = AzureDataset
    
    elif config['dataset'] == 'iphone':
        dataset = iPhoneDataset
    
    elif config['dataset'] == 'realsense':
        dataset = RealsenseDataset

    
    return dataset(config, 
                   config['data']['datadir'], 
                   trainskip=config['data']['trainskip'], 
                   downsample_factor=config['data']['downsample'], 
                   sc_factor=config['data']['sc_factor'])

class BaseDataset(Dataset):
    def __init__(self, cfg):
        self.png_depth_scale = cfg['cam']['png_depth_scale']
        self.H, self.W = cfg['cam']['H']//cfg['data']['downsample'],\
            cfg['cam']['W']//cfg['data']['downsample']

        self.fx, self.fy =  cfg['cam']['fx']//cfg['data']['downsample'],\
             cfg['cam']['fy']//cfg['data']['downsample']
        self.cx, self.cy = cfg['cam']['cx']//cfg['data']['downsample'],\
             cfg['cam']['cy']//cfg['data']['downsample']
        self.distortion = np.array(
            cfg['cam']['distortion']) if 'distortion' in cfg['cam'] else None
        self.crop_size = cfg['cam']['crop_edge'] if 'crop_edge' in cfg['cam'] else 0
        self.ignore_w = cfg['tracking']['ignore_edge_W']
        self.ignore_h = cfg['tracking']['ignore_edge_H']

        self.total_pixels = (self.H - self.crop_size*2) * (self.W - self.crop_size*2)
        self.num_rays_to_save = int(self.total_pixels * cfg['mapping']['n_pixels'])
        
    
    def __len__(self):
        raise NotImplementedError()
    
    def __getitem__(self, index):
        raise NotImplementedError()


class iPhoneDataset(BaseDataset):
    def __init__(self, cfg, basedir, trainskip=1, 
                 downsample_factor=1, translation=0.0, 
                 sc_factor=1., crop=0):
        super(iPhoneDataset, self).__init__(cfg)

        self.basedir = basedir
        self.trainskip = trainskip
        self.downsample_factor = downsample_factor
        self.translation = translation
        self.sc_factor = sc_factor
        self.crop = crop

        self.video_path = os.path.join(self.basedir, 'rgb.mp4')
        if not os.path.exists(os.path.join(basedir, 'images')):
            os.makedirs(os.path.join(basedir, 'images'))
            self.process_video()
        
        self.img_files = [os.path.join(self.basedir, 'images', f) for f in sorted(os.listdir(os.path.join(self.basedir, 'images')), key=alphanum_key) if f.endswith('png')]
        self.depth_paths = [os.path.join(self.basedir, 'depth', f) for f in sorted(os.listdir(os.path.join(basedir, 'depth')), key=alphanum_key) if f.endswith('png')]

        self.poses = self.load_poses(basedir)
        

        self.rays_d = None
        self.tracking_mask = None
        self.frame_ids = range(0, len(self.img_files))
        self.num_frames = len(self.frame_ids)
    
    def __len__(self):
        return self.num_frames
    
    def __getitem__(self, index):
        color_path = self.img_files[index]
        depth_path = self.depth_paths[index]

        color_data = cv2.imread(color_path)
        if '.png' in depth_path:
            depth_data = cv2.imread(depth_path, cv2.IMREAD_UNCHANGED)
        elif '.exr' in depth_path:
            raise NotImplementedError()
        if self.distortion is not None:
            raise NotImplementedError()

        color_data = cv2.cvtColor(color_data, cv2.COLOR_BGR2RGB)
        color_data = color_data / 255.
        depth_data = depth_data.astype(np.float32) / self.png_depth_scale * self.sc_factor

        H, W = depth_data.shape
        color_data = cv2.resize(color_data, (W, H))

        if self.downsample_factor > 1:
            H = H // self.downsample_factor
            W = W // self.downsample_factor
            color_data = cv2.resize(color_data, (W, H), interpolation=cv2.INTER_AREA)
            depth_data = cv2.resize(depth_data, (W, H), interpolation=cv2.INTER_NEAREST)

        if self.rays_d is None:
            self.rays_d = get_camera_rays(self.H, self.W, self.fx, self.fy, self.cx, self.cy)
        
        color_data = torch.from_numpy(color_data.astype(np.float32))
        depth_data = torch.from_numpy(depth_data.astype(np.float32))

        ret = {
            "frame_id": self.frame_ids[index],
            "c2w":  self.poses[index],
            "rgb": color_data,
            "depth": depth_data,
            "direction": self.rays_d,
        }

        return ret
    
    def qTomatrix(self, pose):
        '''
        quaternion to matrix
        '''
        T_WC = np.eye(4)
        T_WC[:3, :3] = Rotation.from_quat(pose[3:]).as_matrix()
        T_WC[:3, 3] = pose[:3]

        T_WC[:3, 1] *= -1
        T_WC[:3, 2] *= -1
        T_WC = torch.from_numpy(T_WC).float()

        return T_WC

    def load_poses(self, basedir):
        '''
        Load poses from odometry.csv
        '''
        path_to_pose = os.path.join(basedir, 'odometry.csv')
        pose_data = np.loadtxt(path_to_pose, delimiter=',', skiprows=1)
        poses = [self.qTomatrix(pose_data[i][2:]) for i in range(pose_data.shape[0])]

        return poses
    
    def process_video(self):
        '''
        Extract frames from video
        '''
        print('processing video')
        vidcap = cv2.VideoCapture(self.video_path)
        frame_count = 0
        num_frames = vidcap.get(cv2.CAP_PROP_FRAME_COUNT) - 1
        print('num_frames:', num_frames)
        while(frame_count < num_frames):
            success,image = vidcap.read()
            cv2.imwrite(os.path.join(self.basedir, 'images', "{:06d}.png".format(frame_count)), image)     # save frame as JPEG file      
            frame_count += 1
        
        print('processing video... done!')


class ReplicaDataset(BaseDataset):
    def __init__(self, cfg, basedir, trainskip=1, 
                 downsample_factor=1, translation=0.0, 
                 sc_factor=1., crop=0):
        super(ReplicaDataset, self).__init__(cfg)

        self.basedir = basedir
        self.trainskip = trainskip
        self.downsample_factor = downsample_factor
        self.translation = translation
        self.sc_factor = sc_factor
        self.crop = crop

        self.traj_perturb=0
        if  'robustness' in cfg.keys() and 'perturb_traj' in cfg['robustness'].keys():
            self.traj_perturb = cfg['robustness']['perturb_traj']
        if self.traj_perturb == 0 or self.traj_perturb == 2:
            self.img_files = sorted(glob.glob(f'{self.basedir}/results/frame*.jpg'))
            self.depth_paths = sorted(
                glob.glob(f'{self.basedir}/results/depth*.png'))
            self.load_poses(os.path.join(self.basedir, 'traj.txt'))
        elif self.traj_perturb == 1:
            self.img_files = sorted(glob.glob(f'{self.basedir}/frame/frame*.png'))
            self.depth_paths = sorted(
                glob.glob(f'{self.basedir}/depth/depth*.npy'))
            self.load_poses(os.path.join(self.basedir, 'trajectory.txt'))
        

        self.rays_d = None
        self.tracking_mask = None
        self.frame_ids = range(0, len(self.img_files), self.trainskip)

        self.num_frames = len(self.frame_ids)

        self.perturb_type = 17
        self.perturb_severity=0
        self.perturb_dynamic=0
        
        if 'robustness' in cfg.keys():
            self.perturb_type = cfg['robustness']['perturb_type']
            self.perturb_severity = cfg['robustness']['perturb_severity']
            self.perturb_dynamic = cfg['robustness']['perturb_dynamic']

            print("#############################################################")
            print("self.perturb_type",self.perturb_type)
            print("self.perturb_severity",self.perturb_severity)
            print("self.perturb_dynamic",self.perturb_dynamic)

    def __len__(self):
        return self.num_frames

    
    def __getitem__(self, index):

        color_path = self.img_files[index * self.trainskip]

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

            depth_index = max(0, min(index - delay, self.num_frames - 1))  # Ensure depth_index is within valid range
        else:
            depth_index = index

        depth_path = self.depth_paths[depth_index * self.trainskip]  # Apply offset to depth index



        color_data = cv2.imread(color_path)
        if '.png' in depth_path:
            depth_data = cv2.imread(depth_path, cv2.IMREAD_UNCHANGED)
        elif '.npy' in depth_path:
            depth_data = np.load(depth_path)
        elif '.exr' in depth_path:
            raise NotImplementedError()
        if self.distortion is not None:
            raise NotImplementedError()

        color_data = cv2.cvtColor(color_data, cv2.COLOR_BGR2RGB)

        color_data = Image.fromarray(color_data)

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
            depth_data = depth_add_gaussian_noise(depth_data,perturb_severity)
        elif perturb_type == 21:
            depth_data = depth_add_edge_erosion(depth_data,perturb_severity)
        elif perturb_type == 22:
            depth_data = depth_add_random_mask(depth_data,perturb_severity)
        elif perturb_type == 23:
            depth_data = depth_add_fixed_mask(depth_data,perturb_severity)
        elif perturb_type >=25:
            pass
        color_data = np.array(color_data)

        #########################

        color_data = color_data / 255.
        depth_data = depth_data.astype(np.float32) / self.png_depth_scale * self.sc_factor
        if perturb_type == 24:
            depth_data = depth_range(depth_data,perturb_severity)
        H, W = depth_data.shape
        color_data = cv2.resize(color_data, (W, H))

        if self.downsample_factor > 1:
            H = H // self.downsample_factor
            W = W // self.downsample_factor
            color_data = cv2.resize(color_data, (W, H), interpolation=cv2.INTER_AREA)
            depth_data = cv2.resize(depth_data, (W, H), interpolation=cv2.INTER_NEAREST)

        if self.rays_d is None:
            self.rays_d = get_camera_rays(self.H, self.W, self.fx, self.fy, self.cx, self.cy)

        color_data = torch.from_numpy(color_data.astype(np.float32))
        depth_data = torch.from_numpy(depth_data.astype(np.float32))
        ret = {
            "frame_id": self.frame_ids[index]//self.trainskip,
            "c2w":  self.poses[index],
            "rgb": color_data,
            "depth": depth_data,
            "direction": self.rays_d,
        }

        return ret


    def load_poses(self, path):
        self.poses = []
        with open(path, "r") as f:
            lines = f.readlines()
        for i in range(len(self.img_files)):
            line = lines[i]
            if self.traj_perturb == 0 or self.traj_perturb == 2:
                c2w = np.array(list(map(float, line.split()))).reshape(4, 4)
                c2w[:3, 1] *= -1
                c2w[:3, 2] *= -1
                c2w[:3, 3] *= self.sc_factor
            else:
                c2w = np.array(list(map(float, line.split())))[1:]
                c2w = quaternion_to_matrix(c2w)
            c2w = torch.from_numpy(c2w).float()
            if self.trainskip ==1:
                self.poses.append(c2w)
            elif i % self.trainskip:
                self.poses.append(c2w)


class ScannetDataset(BaseDataset):
    def __init__(self, cfg, basedir, trainskip=1, 
                 downsample_factor=1, translation=0.0, 
                 sc_factor=1., crop=0):
        super(ScannetDataset, self).__init__(cfg)

        self.config = cfg
        self.basedir = basedir
        self.trainskip = trainskip
        self.downsample_factor = downsample_factor
        self.translation = translation
        self.sc_factor = sc_factor
        self.crop = crop
        self.img_files = sorted(glob.glob(os.path.join(
            self.basedir, 'color', '*.jpg')), key=lambda x: int(os.path.basename(x)[:-4]))
        self.depth_paths = sorted(
            glob.glob(os.path.join(
            self.basedir, 'depth', '*.png')), key=lambda x: int(os.path.basename(x)[:-4]))
        self.load_poses(os.path.join(self.basedir, 'pose'))

        # self.depth_cleaner = cv2.rgbd.DepthCleaner_create(cv2.CV_32F, 5)
        

        self.rays_d = None
        self.frame_ids = range(0, len(self.img_files))
        self.num_frames = len(self.frame_ids)

        if self.config['cam']['crop_edge'] > 0:
            self.H -= self.config['cam']['crop_edge']*2
            self.W -= self.config['cam']['crop_edge']*2
            self.cx -= self.config['cam']['crop_edge']
            self.cy -= self.config['cam']['crop_edge']
   
    def __len__(self):
        return self.num_frames
  
    def __getitem__(self, index):
        color_path = self.img_files[index]
        depth_path = self.depth_paths[index]

        color_data = cv2.imread(color_path)
        if '.png' in depth_path:
            depth_data = cv2.imread(depth_path, cv2.IMREAD_UNCHANGED)
        elif '.exr' in depth_path:
            raise NotImplementedError()
        if self.distortion is not None:
            raise NotImplementedError()

        color_data = cv2.cvtColor(color_data, cv2.COLOR_BGR2RGB)
        color_data = color_data / 255.
        depth_data = depth_data.astype(np.float32) / self.png_depth_scale * self.sc_factor

        H, W = depth_data.shape
        color_data = cv2.resize(color_data, (W, H))

        if self.downsample_factor > 1:
            H = H // self.downsample_factor
            W = W // self.downsample_factor
            self.fx = self.fx // self.downsample_factor
            self.fy = self.fy // self.downsample_factor
            color_data = cv2.resize(color_data, (W, H), interpolation=cv2.INTER_AREA)
            depth_data = cv2.resize(depth_data, (W, H), interpolation=cv2.INTER_NEAREST)
        
        edge = self.config['cam']['crop_edge']
        if edge > 0:
            # crop image edge, there are invalid value on the edge of the color image
            color_data = color_data[edge:-edge, edge:-edge]
            depth_data = depth_data[edge:-edge, edge:-edge]

        if self.rays_d is None:
            self.rays_d = get_camera_rays(self.H, self.W, self.fx, self.fy, self.cx, self.cy)

        color_data = torch.from_numpy(color_data.astype(np.float32))
        depth_data = torch.from_numpy(depth_data.astype(np.float32))

        ret = {
            "frame_id": self.frame_ids[index],
            "c2w":  self.poses[index],
            "rgb": color_data,
            "depth": depth_data,
            "direction": self.rays_d
        }

        return ret

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


class AzureDataset(BaseDataset):
    def __init__(self, cfg, basedir, trainskip=1, 
                 downsample_factor=1, translation=0.0, 
                 sc_factor=1., crop=0):
        super(AzureDataset, self).__init__(cfg)

        self.config = cfg
        self.basedir = basedir
        self.trainskip = trainskip
        self.downsample_factor = downsample_factor
        self.translation = translation
        self.sc_factor = sc_factor
        self.crop = crop
        self.img_files = sorted(
            glob.glob(os.path.join(self.basedir, 'color', '*.jpg')))
        self.depth_paths = sorted(
            glob.glob(os.path.join(self.basedir, 'depth', '*.png')))      

        self.rays_d = None
        self.frame_ids = range(0, len(self.img_files))
        self.num_frames = len(self.frame_ids)
        self.load_poses(os.path.join(self.basedir, 'pose'))  

        if self.config['cam']['crop_edge'] > 0:
            self.H -= self.config['cam']['crop_edge']*2
            self.W -= self.config['cam']['crop_edge']*2
            self.cx -= self.config['cam']['crop_edge']
            self.cy -= self.config['cam']['crop_edge']
 
    def __len__(self):
        return self.num_frames
 
    def __getitem__(self, index):
        color_path = self.img_files[index]
        depth_path = self.depth_paths[index]

        color_data = cv2.imread(color_path)
        if '.png' in depth_path:
            depth_data = cv2.imread(depth_path, cv2.IMREAD_UNCHANGED)
        elif '.exr' in depth_path:
            raise NotImplementedError()
        if self.distortion is not None:
            raise NotImplementedError()

        color_data = cv2.cvtColor(color_data, cv2.COLOR_BGR2RGB)
        color_data = color_data / 255.
        depth_data = depth_data.astype(np.float32) / self.png_depth_scale * self.sc_factor

        H, W = depth_data.shape
        color_data = cv2.resize(color_data, (W, H))

        if self.downsample_factor > 1:
            H = H // self.downsample_factor
            W = W // self.downsample_factor
            self.fx = self.fx // self.downsample_factor
            self.fy = self.fy // self.downsample_factor
            color_data = cv2.resize(color_data, (W, H), interpolation=cv2.INTER_AREA)
            depth_data = cv2.resize(depth_data, (W, H), interpolation=cv2.INTER_NEAREST)

        edge = self.config['cam']['crop_edge']
        if edge > 0:
            # crop image edge, there are invalid value on the edge of the color image
            color_data = color_data[edge:-edge, edge:-edge]
            depth_data = depth_data[edge:-edge, edge:-edge]

        if self.rays_d is None:
            self.rays_d = get_camera_rays(self.H, self.W, self.fx, self.fy, self.cx, self.cy)

        color_data = torch.from_numpy(color_data.astype(np.float32))
        depth_data = torch.from_numpy(depth_data.astype(np.float32))

        ret = {
            "frame_id": self.frame_ids[index],
            "c2w":  self.poses[index],
            "rgb": color_data,
            "depth": depth_data,
            "direction": self.rays_d
        }

        return ret

    def load_poses(self, path):
        principal_inertia_transform = np.array([[-0.14031718, -0.875229  , -0.46290958,  0.75258389],
                                                    [ 0.217254  , -0.48335774,  0.84803655,  0.32966271],
                                                    [-0.96597712,  0.01842514,  0.2579704 ,  3.28585226],
                                                    [ 0.        ,  0.        ,  0.        ,  1.        ]])
        principal_inertia_transform[:3, 1] *= -1
        principal_inertia_transform[:3, 2] *= -1
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
            for i in range(self.num_frames):
                c2w = principal_inertia_transform
                c2w = torch.from_numpy(c2w).float() + 1e-5
                self.poses.append(c2w)


class RGBDataset(BaseDataset):
    def __init__(self, cfg, basedir, trainskip=1, 
                 downsample_factor=1, translation=0.0, 
                 sc_factor=1., crop=0):
        super(RGBDataset, self).__init__(cfg)
        
        self.basedir = basedir
        self.trainskip = trainskip
        self.downsample_factor = downsample_factor
        self.translation = translation
        self.sc_factor = sc_factor
        self.crop = crop
        self.img_files = [os.path.join(self.basedir, 'images', f) for f in sorted(os.listdir(os.path.join(self.basedir, 'images')), key=alphanum_key) if f.endswith('png')]
        self.depth_paths = [os.path.join(self.basedir, 'depth_filtered', f) for f in sorted(os.listdir(os.path.join(self.basedir, 'depth_filtered')), key=alphanum_key) if f.endswith('png')]
        self.gt_depth_paths = [os.path.join(self.basedir, 'depth', f) for f in sorted(os.listdir(os.path.join(basedir, 'depth')), key=alphanum_key) if f.endswith('png')]


        self.all_poses, valid_poses = self.load_poses(os.path.join(self.basedir, 'trainval_poses.txt'))
        self.all_gt_poses, valid_gt_poses = self.load_poses(os.path.join(basedir, 'poses.txt'))

        init_pose = np.array(self.all_poses[0]).astype(np.float32)
        init_gt_pose = np.array(self.all_gt_poses[0]).astype(np.float32)
        self.align_matrix = init_gt_pose @ np.linalg.inv(init_pose)

        self.poses = []
        for pose in self.all_gt_poses:
            self.poses.append(torch.from_numpy(np.array(pose)).float())
        
        self.cfg = cfg 
        self.rays_d = None
        print("self.cfg", self.cfg.keys())
        
        if 'extra' in self.cfg.keys():
            self.fr_ds = int(self.cfg['extra']['FR_DS'])
        else:
            self.fr_ds = 1
        #print("self.fr_ds", self.fr_ds)
        
        self.frame_ids = self.get_frame_ids()
        self.num_frames = len(self.frame_ids)
        

    def get_frame_ids(self, fr_ds = 1):
        frame_ids = []
        num_frames = len(self.img_files)
        train_frame_ids = list(range(0, num_frames, self.trainskip))

        self.frame_ids = []
        for id in train_frame_ids:
            #if valid_poses[id]:
            frame_ids.append(id)
        
        return frame_ids
    
    def __len__(self):
        return self.num_frames

    def __getitem__(self, index):
        index = self.frame_ids[index]
        color_path = self.img_files[index]
        depth_path = self.depth_paths[index]

        color_data = cv2.imread(color_path)
        if '.png' in depth_path:
            depth_data = cv2.imread(depth_path, cv2.IMREAD_UNCHANGED)
        elif '.exr' in depth_path:
            raise NotImplementedError()
        if self.distortion is not None:
            raise NotImplementedError()

        color_data = cv2.cvtColor(color_data, cv2.COLOR_BGR2RGB)
        color_data = color_data / 255.
        depth_data = depth_data.astype(np.float32) / self.png_depth_scale * self.sc_factor

        H, W = depth_data.shape
        color_data = cv2.resize(color_data, (W, H))

        if self.downsample_factor > 1:
            H = H // self.downsample_factor
            W = W // self.downsample_factor
            self.fx = self.fx // self.downsample_factor
            self.fy = self.fy // self.downsample_factor
            color_data = cv2.resize(color_data, (W, H), interpolation=cv2.INTER_AREA)
            depth_data = cv2.resize(depth_data, (W, H), interpolation=cv2.INTER_NEAREST)

        if self.rays_d is None:
            self.rays_d = get_camera_rays(H, W, self.fx, self.fy, self.cx, self.cy)

        color_data = torch.from_numpy(color_data.astype(np.float32))
        depth_data = torch.from_numpy(depth_data.astype(np.float32))
        ret = {
            "frame_id": index//self.trainskip,
            "c2w":  self.poses[index//self.trainskip],
            "rgb": color_data,
            "depth": depth_data,
            "direction": self.rays_d
        }

        return ret

    def load_poses(self, path):
        file = open(path, "r")
        lines = file.readlines()
        file.close()
        poses = []
        valid = []
        lines_per_matrix = 4
        for i in range(0, len(lines), lines_per_matrix*self.trainskip):
            if 'nan' in lines[i]:
                valid.append(False)
                poses.append(np.eye(4, 4, dtype=np.float32).tolist())
            else:
                valid.append(True)
                pose_floats = [[float(x) for x in line.split()] for line in lines[i:i+lines_per_matrix]]
                poses.append(pose_floats)

        return poses, valid


class TUMDataset(BaseDataset):
    def __init__(self, cfg, basedir, align=True, trainskip=1, 
                 downsample_factor=1, translation=0.0, 
                 sc_factor=1., crop=0, load=True):
        super(TUMDataset, self).__init__(cfg)

        self.config = cfg
        self.basedir = basedir
        self.trainskip = trainskip
        self.downsample_factor = downsample_factor
        self.translation = translation
        self.sc_factor = sc_factor
        self.crop = crop

        self.color_paths, self.depth_paths, self.poses = self.loadtum(
            basedir, frame_rate=32)
        
        self.frame_ids = range(0, len(self.color_paths))
        self.num_frames = len(self.frame_ids)

        self.crop_size = cfg['cam']['crop_size'] if 'crop_size' in cfg['cam'] else None

        self.rays_d = None
        sx = self.crop_size[1] / self.W
        sy = self.crop_size[0] / self.H
        self.fx = sx*self.fx
        self.fy = sy*self.fy
        self.cx = sx*self.cx
        self.cy = sy*self.cy
        self.W = self.crop_size[1]
        self.H = self.crop_size[0]

        if self.config['cam']['crop_edge'] > 0:
            self.H -= self.config['cam']['crop_edge']*2
            self.W -= self.config['cam']['crop_edge']*2
            self.cx -= self.config['cam']['crop_edge']
            self.cy -= self.config['cam']['crop_edge']
    
    def pose_matrix_from_quaternion(self, pvec):
        """ convert 4x4 pose matrix to (t, q) """
        from scipy.spatial.transform import Rotation

        pose = np.eye(4)
        pose[:3, :3] = Rotation.from_quat(pvec[3:]).as_matrix()
        pose[:3, 3] = pvec[:3]
        return pose
    
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
    
    def parse_list(self, filepath, skiprows=0):
        """ read list data """
        data = np.loadtxt(filepath, delimiter=' ',
                          dtype=np.unicode_, skiprows=skiprows)
        return data

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
            # if inv_pose is None:
            #     inv_pose = np.linalg.inv(c2w)
            #     c2w = np.eye(4)
            # else:
            #     c2w = inv_pose@c2w
            c2w[:3, 1] *= -1
            c2w[:3, 2] *= -1
            c2w = torch.from_numpy(c2w).float()
            poses += [c2w]

        return images, depths, poses
    
    def __len__(self):
        return self.num_frames
    
    def __getitem__(self, index):
        color_path = self.color_paths[index]
        depth_path = self.depth_paths[index]

        color_data = cv2.imread(color_path)
        if '.png' in depth_path:
            depth_data = cv2.imread(depth_path, cv2.IMREAD_UNCHANGED)
        elif '.exr' in depth_path:
            raise NotImplementedError()
        if self.distortion is not None:
            K = as_intrinsics_matrix([self.config['cam']['fx'], 
                                      self.config['cam']['fy'],
                                      self.config['cam']['cx'], 
                                      self.config['cam']['cy']])
            color_data = cv2.undistort(color_data, K, self.distortion)
        
        color_data = cv2.cvtColor(color_data, cv2.COLOR_BGR2RGB)
        color_data = color_data / 255.
        depth_data = depth_data.astype(np.float32) / self.png_depth_scale * self.sc_factor

        H, W = depth_data.shape
        color_data = cv2.resize(color_data, (W, H))

        if self.downsample_factor > 1:
            H = H // self.downsample_factor
            W = W // self.downsample_factor
            self.fx = self.fx // self.downsample_factor
            self.fy = self.fy // self.downsample_factor
            color_data = cv2.resize(color_data, (W, H), interpolation=cv2.INTER_AREA)
            depth_data = cv2.resize(depth_data, (W, H), interpolation=cv2.INTER_NEAREST)  

        if self.rays_d is None:
            self.rays_d =get_camera_rays(self.H, self.W, self.fx, self.fy, self.cx, self.cy)


        color_data = torch.from_numpy(color_data.astype(np.float32))
        depth_data = torch.from_numpy(depth_data.astype(np.float32))

        if self.crop_size is not None:
            # follow the pre-processing step in lietorch, actually is resize
            color_data = color_data.permute(2, 0, 1)
            color_data = F.interpolate(
                color_data[None], self.crop_size, mode='bilinear', align_corners=True)[0]
            depth_data = F.interpolate(
                depth_data[None, None], self.crop_size, mode='nearest')[0, 0]
            color_data = color_data.permute(1, 2, 0).contiguous()
        
        edge = self.config['cam']['crop_edge']
        if edge > 0:
            # crop image edge, there are invalid value on the edge of the color image
            color_data = color_data[edge:-edge, edge:-edge]
            depth_data = depth_data[edge:-edge, edge:-edge]
        


        ret = {
            "frame_id": self.frame_ids[index],
            "c2w":  self.poses[index],
            "rgb": color_data,
            "depth": depth_data,
            "direction": self.rays_d
        }
        return ret


class RealsenseDataset(BaseDataset):
    def __init__(self, cfg, basedir, align=True, trainskip=1,
                 downsample_factor=1, translation=0.0,
                 sc_factor=1., crop=0, load=True):
        super(RealsenseDataset, self).__init__(cfg)

        self.config = cfg
        self.basedir = basedir
        self.trainskip = trainskip
        self.downsample_factor = downsample_factor
        self.translation = translation
        self.sc_factor = sc_factor
        self.crop = crop
        self.img_files = sorted(
            glob.glob(os.path.join(self.basedir, 'color', '*.jpg')))
        self.depth_paths = sorted(
            glob.glob(os.path.join(self.basedir, 'depth', '*.png')))

        self.rays_d = None
        self.frame_ids = range(0, len(self.img_files))
        self.num_frames = len(self.frame_ids)
        self.load_poses()

        if self.config['cam']['crop_edge'] > 0:
            self.H -= self.config['cam']['crop_edge']*2
            self.W -= self.config['cam']['crop_edge']*2
            self.cx -= self.config['cam']['crop_edge']
            self.cy -= self.config['cam']['crop_edge']

    def __len__(self):
        return self.num_frames

    def __getitem__(self, index):
        color_path = self.img_files[index]
        depth_path = self.depth_paths[index]

        color_data = cv2.imread(color_path)
        if '.png' in depth_path:
            depth_data = cv2.imread(depth_path, cv2.IMREAD_UNCHANGED)
        elif '.exr' in depth_path:
            raise NotImplementedError()
        if self.distortion is not None:
            raise NotImplementedError()

        color_data = cv2.cvtColor(color_data, cv2.COLOR_BGR2RGB)
        color_data = color_data / 255.
        depth_data = depth_data.astype(np.float32) / self.png_depth_scale * self.sc_factor

        H, W = depth_data.shape
        color_data = cv2.resize(color_data, (W, H))

        # TODO: this if statement was actually never used, and will break the program if used
        if self.downsample_factor > 1:
            H = H // self.downsample_factor
            W = W // self.downsample_factor
            self.fx = self.fx // self.downsample_factor
            self.fy = self.fy // self.downsample_factor
            color_data = cv2.resize(color_data, (W, H), interpolation=cv2.INTER_AREA)
            depth_data = cv2.resize(depth_data, (W, H), interpolation=cv2.INTER_NEAREST)

        edge = self.config['cam']['crop_edge']
        if edge > 0:
            # crop image edge, there are invalid value on the edge of the color image
            color_data = color_data[edge:-edge, edge:-edge]
            depth_data = depth_data[edge:-edge, edge:-edge]

        if self.rays_d is None:
            self.rays_d = get_camera_rays(self.H, self.W, self.fx, self.fy, self.cx, self.cy)

        color_data = torch.from_numpy(color_data.astype(np.float32))
        depth_data = torch.from_numpy(depth_data.astype(np.float32))

        ret = {
            "frame_id": self.frame_ids[index],
            "c2w":  self.poses[index],
            "rgb": color_data,
            "depth": depth_data,
            "direction": self.rays_d
        }

        return ret

    def load_poses(self):
        self.align_mat = np.loadtxt(os.path.join(self.basedir, "align_mat.txt"))
        self.poses = []
        path = os.path.join(self.basedir, "scene/trajectory.log")
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
                    c2w = np.array(list(map(float, (''.join(content[i + 1:i + 5])).strip().split()))).reshape((4, 4))
                    # align
                    c2w = self.align_mat @ c2w
                    # To OpenGL
                    c2w[:3, 1] *= -1
                    c2w[:3, 2] *= -1
                    c2w = torch.from_numpy(c2w).float()
                    self.poses.append(c2w)
        else:
            for i in range(self.num_frames):
                c2w = self.align_mat
                c2w = torch.from_numpy(c2w).float()
                self.poses.append(c2w)
