scenes="room2 room0 room1 office4 office3 office2 office1 office0"
pt=17 # perturbation type
pd=0 # if is perturb_dynamic
seed=0 # default as 0

for ds in 10; do
  echo "Running on $sc ..."
  for sev in 0; do
    for sc in ${scenes}; do
      CUDA_VISIBLE_DEVICES=0  python scripts/corrgs.py configs/replica/corrgs_sparse_noisy.py  --force_perturb 1  --scene_name ${sc}   --perturb_type ${pt} --perturb_severity ${sev} --frame_downsample ${ds} --perturb_dynamic ${pd} --seed ${seed}
    done
  done
done


