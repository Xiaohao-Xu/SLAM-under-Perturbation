#!/bin/bash

MODE="mono"
# Set the output directory where the results will be saved.
OUT_DIR="/path/to/output_directory" # Replace with your actual directory path.

scenes="office0 office1 office2 office3 office4 room0 room1 room2"

echo "Start evaluating on the Replica dataset..."

# Robustness evaluation
ds=1 # Downsampling ratio 
pd=0 # If it is perturb_dynamic

for sc in ${scenes}; do
  echo "Running on ${sc} ..."
  # Loop over the severities
  for sev in 5 3 1; do
    for pt in {0..17}; do
      # Update EXPNAME for each perturb_type and severity
      EXPNAME="${sc}_${pt}_${sev}_${pd}_${ds}"
      if [[ $MODE == "mono" ]]; then
        python run.py configs/Replica/${sc}_mono.yaml --device cuda:0 --mode $MODE --output "${OUT_DIR}/${sc}/${EXPNAME}" --perturb_type ${pt} --perturb_severity ${sev} --frame_downsample ${ds} --perturb_dynamic ${pd}
      else
        python run.py configs/Replica/${sc}.yaml --device cuda:0 --mode $MODE --output "${OUT_DIR}/${sc}/${EXPNAME}" --perturb_type ${pt} --perturb_severity ${sev} --frame_downsample ${ds} --perturb_dynamic ${pd}
      fi
      echo "${EXPNAME} done!"
    done
  done
done

echo "Evaluation complete."
