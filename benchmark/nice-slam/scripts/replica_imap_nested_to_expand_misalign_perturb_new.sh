#!/bin/bash

pt=18

# Array of downsample values
ds_values=(1 2 4)

# Array of severity values
sev_values=(5 10 15 20 25)

# Array of perturb_dynamic values
dynamic_values=(0 1)

# Array of configuration files
config_files=("room0" "room1" "room2" "office0" "office1" "office2" "office3" "office4")

# Loop through each severity value
for sev in "${sev_values[@]}"; do
  # Loop through each downsample value
  for ds in "${ds_values[@]}"; do
    # Loop through each perturb_dynamic value
    for dynamic in "${dynamic_values[@]}"; do
      # Loop through each configuration file
      for file in "${config_files[@]}"; do
        # Generate and print the command
        echo "python -W ignore run.py \"configs/Replica/${file}_imap.yaml\" --perturb_type ${pt} --perturb_severity ${sev} --frame_downsample ${ds} --perturb_dynamic ${dynamic} --imap"
      done
    done
  done
done
