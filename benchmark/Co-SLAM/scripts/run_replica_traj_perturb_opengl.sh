
ds=1
perturb_type=17 # no sensor perturbation
perturb_traj_mode=2
ptb_data_dir="/home/huanglab-group/Replica-Dataset-Traj-Perturbed/"
output_dir="../coslam_output/Replica_traj_perturb/"

scene="room_0"
random_type="normal"

rot_deg_list=(0  3 5 10 )  # List of rotation degrees
tran_deg_list=(0 0.1 0.3 0.5)  # List of translation distance

trans_replica_dict=('office_4' 'office_3' 'office_2' 'office_1' 'office_0' "room_0")

for key in "${!trans_replica_dict[@]}"; do
    value="${trans_replica_dict[$key]}"
    echo "Key: $key, Value: $value"
    scene=${value}

    for rot_deg in "${rot_deg_list[@]}"; do
            for tran_deg in "${tran_deg_list[@]}"; do
            config="configs/Replica/${scene//_/}.yaml"
            echo ${config}
            echo ${ptb_data_path}
            ptb_data_path="${ptb_data_dir}/Replica_${scene}_rot_$(echo "$rot_deg" | sed 's/\./dot/')_tran_$(echo "$tran_deg" | sed 's/\./dot/')_${random_type}"
            python coslam.py --config  "configs/Replica/${scene//_/}.yaml" --perturb_type ${perturb_type} --frame_downsample ${ds} --perturb_traj ${perturb_traj_mode} --input_folder ${ptb_data_path} --output ${output_dir}
        done
    done
done






