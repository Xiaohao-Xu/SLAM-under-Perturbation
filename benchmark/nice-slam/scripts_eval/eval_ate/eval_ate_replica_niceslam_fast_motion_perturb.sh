#!/bin/bash
#!/bin/bash

pt=17

# Array of downsample values
ds_values=(2 4 8)

# Array of severity values
sev_values=(1)

# Array of perturb_dynamic values
dynamic_values=(0)

# Array of configuration files
config_files=("room0" "room1" "room2" "office0" "office1" "office2" "office3" "office4")

# Loop through each severity value
for sev in "${sev_values[@]}"; do
  # Loop through each downsample value
  for ds in "${ds_values[@]}"; do
    # Loop through each perturb_dynamic value
    for dynamic in "${dynamic_values[@]}"; do
      # Loop through each configuration file
      for scene in "${config_files[@]}"; do
        echo ${scene}_"${pt}"_"${sev}"_${dynamic}_${faster_motion}
        OUTPUT_FOLDER="/media/huanglab/HuangLab10TB/Download/niceslam_results/Replica_niceslam_motion/"${scene}_"${pt}"_"${sev}"_${dynamic}_${ds}
        python src/tools/eval_ate.py configs/Replica/${scene}.yaml --output $OUTPUT_FOLDER
      done
    done
  done
done














