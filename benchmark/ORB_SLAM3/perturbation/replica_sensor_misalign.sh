#!/bin/bash
ORB_PATH="../"
DATA_PATH="/media/huanglab/HuangLab10TB/slam_team/dataset/Replica"

# ==== Static ====
RESULT_PATH="/media/huanglab/HuangLab10TB/slam_team/sibo/results_replica/sensor_misalign/static/"

for k in 5 10 20;
do

for n in {0..4};
do
    echo "Office $n with misalign $k"

    rosrun ORB_SLAM3 RGBD $ORB_PATH/Vocabulary/ORBvoc.txt $DATA_PATH/cam.yaml & 
    ORB_PID=$!

    python perturb_sensor_misalign.py $DATA_PATH/office${n}/frame/ $DATA_PATH/timestamp_20hz.txt --depth_path=$DATA_PATH/office${n}/depth/ --to_add=${k} &
    IMG_PID=$!
    wait $IMG_PID

    sleep 1s
    rosnode kill /RGBD
    sleep 3s

    mv KeyFrameTrajectory.txt $RESULT_PATH/office${n}_k${k}.txt
    mv NumFeatures.txt $RESULT_PATH/keypoints/office${n}_k${k}_feats.txt
    sleep 1s
done # n office squences

for n in {0..2};
do
    echo "Room $n with misalign $k"

    rosrun ORB_SLAM3 RGBD $ORB_PATH/Vocabulary/ORBvoc.txt $DATA_PATH/cam.yaml & 
    ORB_PID=$!

    python perturb_sensor_misalign.py $DATA_PATH/room${n}/frame/ $DATA_PATH/timestamp_20hz.txt --depth_path=$DATA_PATH/room${n}/depth/ --to_add=${k} &
    IMG_PID=$!
    wait $IMG_PID

    sleep 1s
    rosnode kill /RGBD
    sleep 3s

    mv KeyFrameTrajectory.txt $RESULT_PATH/room${n}_k${k}.txt
    mv NumFeatures.txt $RESULT_PATH/keypoints/room${n}_k${k}_feats.txt
    sleep 1s
done # n room sequences

done # k misaligns


# ==== Dynamic ====
RESULT_PATH="/media/huanglab/HuangLab10TB/slam_team/sibo/results_replica/sensor_misalign/dynamic/"

for k in 5 10 20;
do

for n in {0..4};
do
    echo "Office $n with misalign $k"

    rosrun ORB_SLAM3 RGBD $ORB_PATH/Vocabulary/ORBvoc.txt $DATA_PATH/cam.yaml & 
    ORB_PID=$!

    python perturb_sensor_misalign.py $DATA_PATH/office${n}/frame/ $DATA_PATH/timestamp_20hz.txt --depth_path=$DATA_PATH/office${n}/depth/ --to_add=${k} --dynamic=1 &
    IMG_PID=$!
    wait $IMG_PID

    sleep 2s
    rosnode kill /RGBD
    sleep 3s

    mv KeyFrameTrajectory.txt $RESULT_PATH/office${n}_k${k}.txt
    mv NumFeatures.txt $RESULT_PATH/keypoints/office${n}_k${k}_feats.txt
    sleep 1s
done # n office squences

for n in {0..2};
do
    echo "Room $n with misalign $k"

    rosrun ORB_SLAM3 RGBD $ORB_PATH/Vocabulary/ORBvoc.txt $DATA_PATH/cam.yaml & 
    ORB_PID=$!

    python perturb_sensor_misalign.py $DATA_PATH/room${n}/frame/ $DATA_PATH/timestamp_20hz.txt --depth_path=$DATA_PATH/room${n}/depth/ --to_add=${k} --dynamic=1 &
    IMG_PID=$!
    wait $IMG_PID

    sleep 2s
    rosnode kill /RGBD
    sleep 3s

    mv KeyFrameTrajectory.txt $RESULT_PATH/room${n}_k${k}.txt
    mv NumFeatures.txt $RESULT_PATH/keypoints/room${n}_k${k}_feats.txt
    sleep 1s
done # n room sequences

done # k misaligns

