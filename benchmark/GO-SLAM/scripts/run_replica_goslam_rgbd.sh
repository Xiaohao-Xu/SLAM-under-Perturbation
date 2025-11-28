MODE="rgbd"
#EXPNAME=$2

# Set the output directory where the results will be saved.
OUT_DIR="/output/Replica/rgbd" # Replace with your actual directory path.

scenes="office0 office1 office2 office3 office4 room0 room1 room2"

echo "Start evaluating on Replica dataset..."

# Robustness evaluation
pt=17 # perturbation type
pd=0 # if is perturb_dynamic

for sc in ${scenes}; do
  echo "Running on $sc ..."
  for sev in 5 3 1; do
    for ds in 1; do
      EXPNAME="${sc}_${pt}_${sev}_${pd}_${ds}"
      print $EXPNAME
      if [[ $MODE == "mono" ]]; then
        python run.py configs/Replica/${sc}_mono.yaml --device cuda:0 --mode $MODE --output "${OUT_DIR}/${sc}/${EXPNAME}" --perturb_type ${pt} --perturb_severity ${sev} --frame_downsample ${ds} --perturb_dynamic ${pd}
      else
        python run.py configs/Replica/${sc}.yaml --device cuda:0 --mode $MODE --output "${OUT_DIR}/${sc}/${EXPNAME}" --perturb_type ${pt} --perturb_severity ${sev} --frame_downsample ${ds} --perturb_dynamic ${pd}
      fi
      echo "${EXPNAME} done!"
    done
  done
done



