
ds=1
perturb_type=17 # no perturbation
perturb_traj_mode=2
ptb_data_path="/home/huanglab-group/Replica-Dataset-Traj-Perturbed/Replica_office_1_rot_0_tran_0_normal"
output_dir="../coslam_output/Replica_traj_perturb/"

python coslam.py --config  configs/Replica/office1.yaml --perturb_type ${perturb_type} --frame_downsample ${ds} --perturb_traj ${perturb_traj_mode} --input_folder ${ptb_data_path} --output ${output_dir}





