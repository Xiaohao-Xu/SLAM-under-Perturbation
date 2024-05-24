scenes="office0 office1 office2 office3 office4 room0 room1 room2"

# Robustness evaluation
pt=18 # perturbation type
pd=0 # if is perturb_dynamic
seed=0 # default as 0

for sc in ${scenes}; do
  echo "Running on $sc ..."
  for sev in 5 10 20; do
    for ds in 1; do
      EXPNAME="${sc}_${pt}_${sev}_${pd}_${ds}"
      print $EXPNAME
       CUDA_VISIBLE_DEVICES=0  python scripts/splatam.py configs/replica/splatam_s.py --scene_name ${sc}  --perturb_type ${pt} --perturb_severity ${sev} --frame_downsample ${ds} --perturb_dynamic ${pd} --seed ${seed}
      echo "${EXPNAME} done!"
    done
  done
done

pd=1 # if is perturb_dynamic


for sc in ${scenes}; do
  echo "Running on $sc ..."
  for sev in 5 10 20; do
    for ds in 1; do
      EXPNAME="${sc}_${pt}_${sev}_${pd}_${ds}"
      print $EXPNAME
       CUDA_VISIBLE_DEVICES=0  python scripts/splatam.py configs/replica/splatam_s.py --scene_name ${sc}  --perturb_type ${pt} --perturb_severity ${sev} --frame_downsample ${ds} --perturb_dynamic ${pd} --seed ${seed}
      echo "${EXPNAME} done!"
    done
  done
done

