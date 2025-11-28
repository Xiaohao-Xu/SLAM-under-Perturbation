#!/bin/bash
ORB_PATH="/home/huanglab/ORB_SLAM3"
DATA_PATH="/media/huanglab/HuangLab10TB/slam_team/dataset/Replica"
PERTURBED_PATH="/media/huanglab/HuangLab10TB/slam_team/dataset/Replica-Dataset-Traj-Perturbed_simple"

# RESULT_PATH="/media/huanglab/HuangLab10TB/slam_team/sibo/results_replica/rgbd/rgbd1_image_perturbation/"

METHOD="gaussian_noise"
k=3
n=1

ri="1"
ti="0dot0125"

echo "Room $n with level $k"

rosrun ORB_SLAM3 RGBD $ORB_PATH/Vocabulary/ORBvoc.txt $DATA_PATH/cam.yaml & 
ORB_PID=$!

python perturb_image.py $DATA_PATH/room${n}/frame/ $DATA_PATH/timestamp_20hz.txt --depth_path=$DATA_PATH/room${n}/depth/ --method=${METHOD} --severity=${k} &
# python perturb_image.py $PERTURBED_PATH/Replica_room_${n}_rot_${ri}_tran_${ti}_normal/results/ $DATA_PATH/timestamp_20hz.txt --depth_path=$PERTURBED_PATH/Replica_room_${n}_rot_${ri}_tran_${ti}_normal/results/ --method=none --severity=0 &
IMG_PID=$!
wait $IMG_PID

sleep 1s
rosnode kill /RGBD
sleep 3s

# mv KeyFrameTrajectory.txt $RESULT_PATH/room${n}_${METHOD}_${k}.txt
# mv NumFeatures.txt $RESULT_PATH/keypoints/room${n}_${METHOD}_${k}_feats.txt
# sleep 1s

