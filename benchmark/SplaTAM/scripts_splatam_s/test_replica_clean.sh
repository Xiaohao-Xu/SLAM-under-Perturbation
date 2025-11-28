scenes="office0 office1 office2 office3 office4 room0 room1 room2"

echo "Start evaluating on Replica dataset..."

# Robustness evaluation
pt=17 # perturbation type
pd=0 # if is perturb_dynamic
seed=0 # default as 0

for sc in ${scenes}; do
  echo "Running on $sc ..."
  for sev in 5 3 1; do
    for ds in 1; do
      EXPNAME="${sc}_${pt}_${sev}_${pd}_${ds}"
      print $EXPNAME
       CUDA_VISIBLE_DEVICES=1  python scripts/splatam.py configs/replica/splatam_s.py --scene_name ${sc}  --perturb_type ${pt} --perturb_severity ${sev} --frame_downsample ${ds} --perturb_dynamic ${pd} --seed ${seed}
      echo "${EXPNAME} done!"
    done
  done
done
