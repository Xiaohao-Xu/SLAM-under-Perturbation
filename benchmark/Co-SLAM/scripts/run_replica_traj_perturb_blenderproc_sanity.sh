
ds=1

ptb_data_path="/home/huanglab-group/rendered_dataset/replica_render_traj_ptb_rgbd_v3/Replica_room_0_rot_0_tran_0_normal/"



#ptb_data_path="/home/huanglab-group/rendered_dataset/replica_render_traj_ptb_rgbd_v3/Replica_room_0_rot_5_tran_0dot3_normal/"
python coslam.py --config  configs/Replica/room0.yaml --perturb_type 17 --frame_downsample ${ds} --perturb_traj 1 --input_folder ${ptb_data_path}
<<!
python coslam.py --config  configs/Replica/office1.yaml --perturb_type 17 --frame_downsample ${ds} --perturb_traj 1 --input_folder ${ptb_data_path}
python coslam.py --config  configs/Replica/office2.yaml --perturb_type 17 --frame_downsample ${ds}  --perturb_traj 1 --input_folder ${ptb_data_path}
python coslam.py --config  configs/Replica/office3.yaml --perturb_type 17 --frame_downsample ${ds}  --perturb_traj 1 --input_folder ${ptb_data_path}
python coslam.py --config  configs/Replica/office4.yaml --perturb_type 17 --frame_downsample ${ds}  --perturb_traj 1 --input_folder ${ptb_data_path}
python coslam.py --config  configs/Replica/room0.yaml --perturb_type 17 --frame_downsample ${ds}  --perturb_traj 1 --input_folder ${ptb_data_path}
python coslam.py --config  configs/Replica/room1.yaml --perturb_type 17 --frame_downsample ${ds}  --perturb_traj 1 --input_folder ${ptb_data_path}
python coslam.py --config  configs/Replica/room2.yaml --perturb_type 17 --frame_downsample ${ds}  --perturb_traj 1 --input_folder ${ptb_data_path}
!



