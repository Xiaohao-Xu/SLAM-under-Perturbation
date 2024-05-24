#!/bin/bash
ORB_PATH="../"
DATA_PATH="/media/huanglab/HuangLab10TB/slam_team/dataset/Replica"
RESULT_PATH="/media/huanglab/HuangLab10TB/slam_team/sibo/results_replica/rgbd/rgbd1_depth_perturbation/"

# METHODS=("depth_add_gaussian_noise" "depth_add_edge_erosion" "depth_add_random_mask" "depth_range")
METHODS=("depth_range")

for k in {3..4..2};
do

for m in ${METHODS[*]};
do

for n in {0..4};
do
    echo "Office $n with level $k"

    rosrun ORB_SLAM3 RGBD $ORB_PATH/Vocabulary/ORBvoc.txt $DATA_PATH/cam.yaml & 
    ORB_PID=$!

    python perturb_depth.py $DATA_PATH/office${n}/frame/ $DATA_PATH/timestamp_20hz.txt --depth_path=$DATA_PATH/office${n}/depth/ --method=${m} --severity=${k} &
    IMG_PID=$!
    wait $IMG_PID

    sleep 1s
    rosnode kill /RGBD
    sleep 3s

    mv KeyFrameTrajectory.txt $RESULT_PATH/office${n}_${m}_${k}.txt
    mv NumFeatures.txt $RESULT_PATH/keypoints/office${n}_${m}_${k}_feats.txt
    sleep 1s
done # n office squences

for n in {0..2};
do
    echo "Room $n with level $k"

    rosrun ORB_SLAM3 RGBD $ORB_PATH/Vocabulary/ORBvoc.txt $DATA_PATH/cam.yaml & 
    ORB_PID=$!

    python perturb_depth.py $DATA_PATH/room${n}/frame/ $DATA_PATH/timestamp_20hz.txt --depth_path=$DATA_PATH/room${n}/depth/ --method=${m} --severity=${k} &
    IMG_PID=$!
    wait $IMG_PID

    sleep 1s
    rosnode kill /RGBD
    sleep 3s

    mv KeyFrameTrajectory.txt $RESULT_PATH/room${n}_${m}_${k}.txt
    mv NumFeatures.txt $RESULT_PATH/keypoints/room${n}_${m}_${k}_feats.txt
    sleep 1s
done # n room sequences

done # METHODS

done # k severity
