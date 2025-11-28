#!/bin/bash
ORB_PATH="../"
DATA_PATH="/media/huanglab/HuangLab10TB/slam_team/dataset/tum_vi"
RESULT_PATH="/media/huanglab/HuangLab10TB/slam_team/dataset/tum_vi"

METHOD="gaussian_blur"
for n in {1..5};
do
    for k in {1..5..2};
    do
        echo "Corrdior $n with level $k"

        rosrun ORB_SLAM3 Mono $ORB_PATH/Vocabulary/ORBvoc.txt $ORB_PATH/Examples_old/Monocular/TUM-VI.yaml & 
        ORB_PID=$!

        python perturb_rosbag.py $DATA_PATH/dataset-corridor${n}_512_16.bag --publish_to=topic --method=${METHOD} --severity=${k} &
        IMG_PID=$!
        wait $IMG_PID

        sleep 1s
        rosnode kill /Mono
        sleep 3s

        mv KeyFrameTrajectory.txt $RESULT_PATH/corri${n}_${METHOD}_${k}.txt
        sleep 2s
    done
done