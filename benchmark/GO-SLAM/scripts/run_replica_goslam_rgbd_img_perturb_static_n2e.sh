#!/bin/bash

# Configuration variables
MODE="rgbd"
OUT_DIR="/path/to/output_directory" # Replace with your actual directory path.
SCENES="office0 office1 office2 office3 office4 room0 room1 room2"
DS=1 # Downsampling ratio.
PD=0 # If it is perturb_dynamic.
EXPANDED_SCRIPT_NAME="run_replica_goslam_rgbd_img_perturb_static_expand.sh" # The name of the generated script

# Start generating the expanded script.
echo "#!/bin/bash" > $EXPANDED_SCRIPT_NAME
echo "" >> $EXPANDED_SCRIPT_NAME
echo "MODE=\"$MODE\"" >> $EXPANDED_SCRIPT_NAME
echo "OUT_DIR=\"$OUT_DIR\"" >> $EXPANDED_SCRIPT_NAME
echo "" >> $EXPANDED_SCRIPT_NAME
echo "echo \"Start evaluating on the Replica dataset...\"" >> $EXPANDED_SCRIPT_NAME

# Generate commands for each combination.
for sc in $SCENES; do
  for sev in 5 3 1; do
    for pt in $(seq 0 17); do  # Now using seq to generate numbers from 0 to 17.
      EXPNAME="${sc}_${pt}_${sev}_${PD}_${DS}"
      CONFIG_PATH="configs/Replica/${sc}.yaml" # The script assumes mono mode configuration.

      # Append the expanded command to the script.
      echo "echo \"Running on $sc with perturbation type $pt and severity $sev...\"" >> $EXPANDED_SCRIPT_NAME
      echo "python run.py $CONFIG_PATH --device cuda:0 --mode $MODE --output \"\${OUT_DIR}/$sc/$EXPNAME\" --perturb_type $pt --perturb_severity $sev --frame_downsample $DS --perturb_dynamic $PD" >> $EXPANDED_SCRIPT_NAME
      echo "echo \"$EXPNAME done!\"" >> $EXPANDED_SCRIPT_NAME
      echo "" >> $EXPANDED_SCRIPT_NAME
    done
  done
done

# Echo a final message to signal the completion of all experiments.
echo "echo \"Evaluation complete.\"" >> $EXPANDED_SCRIPT_NAME

# Give execution permission to the generated script.
chmod +x $EXPANDED_SCRIPT_NAME

echo "Expanded script generated as $EXPANDED_SCRIPT_NAME"
