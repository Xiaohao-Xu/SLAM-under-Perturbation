#!/bin/bash

# Generate and print out the command for each combination of settings

# Array of perturb_type values from 20 to 24
pt_values=({20..24})

# Array of downsample values
ds_values=(1)

# Array of severity values
sev_values=(1 3 5)

# Array of perturb_dynamic values
dynamic_values=(0 1)

# Array of configuration files
config_files=("room0" "room1" "room2" "office0" "office1" "office2" "office3" "office4")

# Loop through each perturb_type value
for pt in "${pt_values[@]}"; do
  # Loop through each severity value
  for sev in "${sev_values[@]}"; do
    # Loop through each downsample value
    for ds in "${ds_values[@]}"; do
      # Loop through each perturb_dynamic value
      for dynamic in "${dynamic_values[@]}"; do
        # Loop through each configuration file
        for file in "${config_files[@]}"; do
          echo "python -W ignore run.py \"configs/Replica/${file}.yaml\" --perturb_type ${pt} --perturb_severity ${sev} --frame_downsample ${ds} --perturb_dynamic ${dynamic}"
        done
      done
    done
  done
done
