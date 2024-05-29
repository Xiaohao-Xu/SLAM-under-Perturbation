#!/bin/bash
scenes=("room0" "room1" "room2" "office0" "office1" "office2" "office3" "office4")

faster_motion=1

for scene in "${scenes[@]}"
  do
  echo $scene
  perturb_mode=1
  for ((i=0; i<=17; i++))
    do
      for j in 1 3 5
      do
        echo ${scene}_"$i"_"$j"_${perturb_mode}_${faster_motion}
        OUTPUT_FOLDER='/media/huanglab/HuangLab10TB/Download/imap_results/Replica_imap_imageperturb_dynamic_new/'${scene}_imap_"$i"_"$j"_${perturb_mode}_${faster_motion}
        python src/tools/eval_ate.py configs/Replica/${scene}.yaml --output $OUTPUT_FOLDER  --imap
      done
  done
done
