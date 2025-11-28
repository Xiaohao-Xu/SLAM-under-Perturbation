#!/bin/bash
ORB_PATH="../"
DATA_PATH="/media/huanglab/HuangLab10TB/slam_team/dataset/Replica"

RESULT_PATH="/media/huanglab/HuangLab10TB/slam_team/sibo/results_replica/rgbd/rgbd1_faster_motion/"

for k in 2 4 8;
do

for n in {0..4};
do
    echo "Office $n with ratio $k"

    rosrun ORB_SLAM3 RGBD $ORB_PATH/Vocabulary/ORBvoc.txt $DATA_PATH/cam.yaml & 
    ORB_PID=$!

    python perturb_faster_motion.py $DATA_PATH/office${n}/frame/ $DATA_PATH/timestamp_20hz.txt --depth_path=$DATA_PATH/office${n}/depth/ --ratio=${k} &
    IMG_PID=$!
    wait $IMG_PID

    sleep 1s
    rosnode kill /RGBD
    sleep 3s

    mv KeyFrameTrajectory.txt $RESULT_PATH/office${n}_r${k}.txt
    mv NumFeatures.txt $RESULT_PATH/keypoints/office${n}_r${k}_feats.txt
    sleep 1s
done # n office squences

for n in {0..2};
do
    echo "Room $n with ratio $k"

    rosrun ORB_SLAM3 RGBD $ORB_PATH/Vocabulary/ORBvoc.txt $DATA_PATH/cam.yaml & 
    ORB_PID=$!

    python perturb_faster_motion.py $DATA_PATH/room${n}/frame/ $DATA_PATH/timestamp_20hz.txt --depth_path=$DATA_PATH/room${n}/depth/ --ratio=${k} &
    IMG_PID=$!
    wait $IMG_PID

    sleep 1s
    rosnode kill /RGBD
    sleep 3s

    mv KeyFrameTrajectory.txt $RESULT_PATH/room${n}_r${k}.txt
    mv NumFeatures.txt $RESULT_PATH/keypoints/room${n}_r${k}_feats.txt
    sleep 1s
done # n room sequences

done # k ratios


RESULT_PATH="/media/huanglab/HuangLab10TB/slam_team/sibo/results_replica/mono/mono1_faster_motion/"

for k in 2 4 8;
do

for n in {0..4};
do
    echo "Office $n with ratio $k"

    rosrun ORB_SLAM3 Mono $ORB_PATH/Vocabulary/ORBvoc.txt $DATA_PATH/cam.yaml & 
    ORB_PID=$!

    python perturb_faster_motion.py $DATA_PATH/office${n}/frame/ $DATA_PATH/timestamp_20hz.txt --ratio=${k} &
    IMG_PID=$!
    wait $IMG_PID

    sleep 1s
    rosnode kill /Mono
    sleep 3s

    mv KeyFrameTrajectory.txt $RESULT_PATH/office${n}_r${k}.txt
    mv NumFeatures.txt $RESULT_PATH/keypoints/office${n}_r${k}_feats.txt
    sleep 1s
done # n office squences

for n in {0..2};
do
    echo "Room $n with ratio $k"

    rosrun ORB_SLAM3 Mono $ORB_PATH/Vocabulary/ORBvoc.txt $DATA_PATH/cam.yaml & 
    ORB_PID=$!

    python perturb_faster_motion.py $DATA_PATH/room${n}/frame/ $DATA_PATH/timestamp_20hz.txt --ratio=${k} &
    IMG_PID=$!
    wait $IMG_PID

    sleep 1s
    rosnode kill /Mono
    sleep 3s

    mv KeyFrameTrajectory.txt $RESULT_PATH/room${n}_r${k}.txt
    mv NumFeatures.txt $RESULT_PATH/keypoints/room${n}_r${k}_feats.txt
    sleep 1s
done # n room sequences

done # k ratios