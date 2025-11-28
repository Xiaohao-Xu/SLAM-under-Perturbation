#!/bin/bash

echo "Start evaluating on the Replica dataset..."
MODE="rgbd"
# Set the output directory where the results will be saved.
OUT_DIR="/path/to/output_directory" # Replace with your actual directory path.

scenes="office0 office1 office2 office3 office4 room0 room1 room2"

scene="room_0"
random_type="normal"

rot_deg_list=(0 1 3 5)  # List of rotation degrees
tran_deg_list=(0 0.0125 0.025 0.05)  # List of translation distance
ds=1 # Downsampling ratio 
pd=0 # If it is perturb_dynamic
perturb_type=17 # no perturbation
ptb_data_dir="/home/huanglab-group/Replica-Dataset-Traj-Perturbed_simple/"
for scene in ${scenes}; do
  echo "Running on ${sc} ..."
  # Loop over the severities
  for sev in 5 3 1; do
    for pt in 17; do
      for rot_deg in "${rot_deg_list[@]}"; do
        for tran_deg in "${tran_deg_list[@]}"; do
          # Update EXPNAME for each perturb_type and severity
          # EXPNAME="${sc}_${pt}_${sev}_${pd}_${ds}"
          EXPNAME="Replica_${scene}_rot_$(echo "$rot_deg" | sed 's/\./dot/')_tran_$(echo "$tran_deg" | sed 's/\./dot/')_${random_type}"
          ptb_data_path="${ptb_data_dir}/Replica_${scene}_rot_$(echo "$rot_deg" | sed 's/\./dot/')_tran_$(echo "$tran_deg" | sed 's/\./dot/')_${random_type}"
          if [[ $MODE == "mono" ]]; then
            python run.py configs/Replica/${scene}_mono.yaml --device cuda:0 --mode $MODE --input_folder ${ptb_data_path} --output "${OUT_DIR}/${sc}/${EXPNAME}" --perturb_type ${pt} --perturb_severity ${sev} --frame_downsample ${ds} --perturb_dynamic ${pd}
          else
            python run.py configs/Replica/${scene}.yaml --device cuda:0 --mode $MODE --input_folder ${ptb_data_path} --output "${OUT_DIR}/${sc}/${EXPNAME}" --perturb_type ${pt} --perturb_severity ${sev} --frame_downsample ${ds} --perturb_dynamic ${pd}
          fi
          echo "${EXPNAME} done!"
        done
      done
    done
  done
done






echo "Evaluation complete."
