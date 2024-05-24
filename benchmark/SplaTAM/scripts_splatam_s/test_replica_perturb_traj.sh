scene="room_0"
random_type="normal"

# Robustness evaluation
pt=17 # perturbation type
pd=0 # if is perturb_dynamic
seed=0 # default as 0
sev=1
ds=1
perturb_traj_mode=2
rot_deg_list=(0 1 3 5)  # List of rotation degrees
tran_deg_list=(0 0.0125 0.025 0.05)  # List of translation distance
ptb_data_dir="/splatam_self/data/Replica-Dataset-Traj-Perturbed_simple"
output_dir="~/splatam_output/Replica_traj_perturb/"

trans_replica_dict=('office_0' 'office_1' 'office_2'  'office_3' 'office_4'  'room_0' 'room_1' 'room_2')

for key in "${!trans_replica_dict[@]}"; do
    value="${trans_replica_dict[$key]}"
    echo "Key: $key, Value: $value"
    scene=${value}

    for rot_deg in "${rot_deg_list[@]}"; do
            for tran_deg in "${tran_deg_list[@]}"; do
            config="configs/Replica/${scene//_/}.yaml"
            echo ${config}
            ptb_data_path="${ptb_data_dir}/Replica_${scene}_rot_$(echo "$rot_deg" | sed 's/\./dot/')_tran_$(echo "$tran_deg" | sed 's/\./dot/')_${random_type}"
            echo ${ptb_data_path}

            CUDA_VISIBLE_DEVICES=0  python scripts/splatam.py configs/replica/splatam_s.py --scene_name "${scene//_/}" \
        --perturb_type ${pt} --perturb_severity ${sev} --frame_downsample ${ds} --perturb_dynamic ${pd} \
         --perturb_traj ${perturb_traj_mode} --input_folder ${ptb_data_path} \
         --output ${output_dir} --seed ${seed}
        done
    done
done



