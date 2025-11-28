#!/bin/bash

#OUT_DIR="/path/to/output_directory" # Replace with your actual directory path.

#scenes="office0 office1 office2 office3 office4 room0 room1 room2"

OUT_DIR="../output_imap" # Replace with your actual directory path.

scenes="office_0 office_1 office_2 office_3 office_4 room_0 room_1 room_2"


scene="room_0"
random_type="normal"

rot_deg_list=(0 1 3 5)  # List of rotation degrees
tran_deg_list=(0 0.0125 0.025 0.05)  # List of translation distance
ds=1 # Downsampling ratio
dynamic=0 # If it is perturb_dynamic
perturb_type=17 # no perturbation
ptb_data_dir="/mnt/data/robust-eval/Replica-Dataset-Traj-Perturbed_simple/"
for scene in ${scenes}; do
  echo "Running on ${scene} ..."
  # Loop over the severities
  for sev in 1; do
    for pt in 17; do
      for rot_deg in "${rot_deg_list[@]}"; do
        for tran_deg in "${tran_deg_list[@]}"; do
          # Update EXPNAME for each perturb_type and severity
          # EXPNAME="${sc}_${pt}_${sev}_${pd}_${ds}"
          EXPNAME="Replica_${scene}_rot_$(echo "$rot_deg" | sed 's/\./dot/')_tran_$(echo "$tran_deg" | sed 's/\./dot/')_${random_type}"
          ptb_data_path="${ptb_data_dir}/Replica_${scene}_rot_$(echo "$rot_deg" | sed 's/\./dot/')_tran_$(echo "$tran_deg" | sed 's/\./dot/')_${random_type}"     
          echo ${EXPNAME}
          echo ${ptb_data_path}
          CUDA_VISIBLE_DEVICES=1 python -W ignore run.py configs/Replica/$(echo "$scene" | tr -d '_')_imap.yaml --perturb_type ${pt} --perturb_severity ${sev} --frame_downsample ${ds} --perturb_dynamic ${dynamic} --input_folder ${ptb_data_path} --output "${OUT_DIR}/${sc}/${EXPNAME}"  --imap
        done
      done
    done
  done
done
