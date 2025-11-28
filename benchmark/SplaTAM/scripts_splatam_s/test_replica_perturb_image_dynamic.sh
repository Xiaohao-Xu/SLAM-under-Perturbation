scenes="office0 office1 office2 office3 office4 room0 room1 room2"

# Robustness evaluation
pt=0 # perturbation type
pd=1 # if is perturb_dynamic
seed=0 # default as 0

for sc in ${scenes}; do
  echo "Running on $sc ..."
  for pt in {0..17}; do
  for sev in 1 3 5; do
    for ds in 1; do
      EXPNAME="${sc}_${pt}_${sev}_${pd}_${ds}"
      print $EXPNAME
       CUDA_VISIBLE_DEVICES=6  python scripts/splatam.py configs/replica/splatam_s.py --scene_name ${sc}  --perturb_type ${pt} --perturb_severity ${sev} --frame_downsample ${ds} --perturb_dynamic ${pd} --seed ${seed}
      echo "${EXPNAME} done!"
    done
  done
  done
done
