#!/bin/bash
DATA_PATH="/media/huanglab/HuangLab10TB/slam_team/dataset/Replica"

# "motion_blur" and "glass_blur" require longer times to be perturbed
METHODS=("glass_blur")
# METHODS=("motion_blur")

for k in {5..5..2};
do

for m in ${METHODS[*]};
do

for n in {0..4};
do
    echo "Office $n with level $k"

    python perturb_image_and_save.py $DATA_PATH/office${n}/frame/ --method=${m} --severity=${k} &
    SAVE_PID=$!
    wait $SAVE_PID
done # n office squences

for n in {0..2};
do
    echo "Room $n with level $k"

    python perturb_images_save.py $DATA_PATH/room${n}/frame/ --method=${m} --severity=${k} &
    SAVE_PID=$!
    wait $SAVE_PID
done # n room sequences

done # METHODS

done # k severity
