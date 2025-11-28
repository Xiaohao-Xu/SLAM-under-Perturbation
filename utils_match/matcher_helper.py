import torch
from LoFTR.src.loftr import LoFTR, default_cfg
from copy import deepcopy
import numpy as np
from typing import NamedTuple

# Load the pre-trained LoFTR model. For more details, please refer to https://github.com/zju3dv/LoFTR.
def load_LoFTR(ckpt_path:str, temp_bug_fix:bool, use_half_precision=True):
    _default_cfg = deepcopy(default_cfg)
    _default_cfg['coarse']['temp_bug_fix'] = temp_bug_fix  # set to False when using the old ckpt
   
    LoFTR_model = LoFTR(config=_default_cfg)
    LoFTR_model.load_state_dict(torch.load(ckpt_path)['state_dict'])

    if use_half_precision:
        LoFTR_model = LoFTR_model.half()

    LoFTR_model= LoFTR_model.eval().cuda()

    vanilla = torch.tensor(torch.zeros([1, 1, 32, 64]), dtype = torch.float32).cuda()

    if use_half_precision:
        batch = {'image0':vanilla.half(), 'image1':vanilla.half()}
    else:
        batch = {'image0':vanilla, 'image1':vanilla}
    LoFTR_model(batch)

    return LoFTR_model

rot_psi = lambda phi: np.array([
        [1, 0, 0, 0],
        [0, np.cos(phi), -np.sin(phi), 0],
        [0, np.sin(phi), np.cos(phi), 0],
        [0, 0, 0, 1]])

rot_theta = lambda th: np.array([
        [np.cos(th), 0, -np.sin(th), 0],
        [0, 1, 0, 0],
        [np.sin(th), 0, np.cos(th), 0],
        [0, 0, 0, 1]])

rot_phi = lambda psi: np.array([
        [np.cos(psi), -np.sin(psi), 0, 0],
        [np.sin(psi), np.cos(psi), 0, 0],
        [0, 0, 1, 0],
        [0, 0, 0, 1]])

def trans_t_xyz(tx, ty, tz):
    T = np.array([
        [1, 0, 0, tx],
        [0, 1, 0, ty],
        [0, 0, 1, tz],
        [0, 0, 0, 1]
    ])
    return T

def combine_3dgs_rotation_translation(R_c2w, T_w2c):
    RT_w2c = np.eye(4)
    RT_w2c[:3, :3] = R_c2w.T
    RT_w2c[:3, 3] = T_w2c
    RT_c2w=np.linalg.inv(RT_w2c)
    return RT_c2w

