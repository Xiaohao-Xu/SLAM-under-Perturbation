#!/bin/bash

# Configuration variables
MODE="mono"
OUT_DIR="/path/to/output_directory" # Replace with your actual directory path.
SCENES="office0 office1 office2 office3 office4 room0 room1 room2"
PT=17 # Perturbation type.
PD=0  # Perturbation dynamic (0 for static, 1 for dynamic).
EXPANDED_SCRIPT_NAME="run_replica_goslam_mono_faster_motion_expanded.sh" # The name of the generated script

# Start generating the expanded script.
echo "#!/bin/bash" > $EXPANDED_SCRIPT_NAME
echo "" >> $EXPANDED_SCRIPT_NAME
echo "MODE=\"$MODE\"" >> $EXPANDED_SCRIPT_NAME
echo "OUT_DIR=\"$OUT_DIR\"" >> $EXPANDED_SCRIPT_NAME
echo "" >> $EXPANDED_SCRIPT_NAME

# Generate commands for each combination.
for sc in $SCENES; do
  for sev in 5 3 1; do
    for ds in 2 4 8 16; do
      EXPNAME="${sc}_${PT}_${sev}_${PD}_${ds}"
      CONFIG_PATH="configs/Replica/${sc}.yaml"
      if [[ $MODE == "mono" ]]; then
        CONFIG_PATH="configs/Replica/${sc}_mono.yaml"
      fi
      
      # Append the expanded command to the script.
      echo "echo \"Running on $sc with severity $sev and downsample $ds...\"" >> $EXPANDED_SCRIPT_NAME
      echo "python run.py $CONFIG_PATH --device cuda:0 --mode $MODE --output \"\${OUT_DIR}/$sc/$EXPNAME\" --perturb_type $PT --perturb_severity $sev --frame_downsample $ds --perturb_dynamic $PD" >> $EXPANDED_SCRIPT_NAME
      echo "echo \"$EXPNAME done!\"" >> $EXPANDED_SCRIPT_NAME
      echo "" >> $EXPANDED_SCRIPT_NAME
    done
  done
done

# Echo a final message to signal the completion of all experiments.
echo "echo \"All evaluations on the Replica dataset completed.\"" >> $EXPANDED_SCRIPT_NAME

# Give execution permission to the generated script.
chmod +x $EXPANDED_SCRIPT_NAME

echo "Expanded script generated as $EXPANDED_SCRIPT_NAME"
