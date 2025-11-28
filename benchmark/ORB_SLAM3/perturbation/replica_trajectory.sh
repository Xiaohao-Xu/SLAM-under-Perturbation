#!/bin/bash
ORB_PATH="../"
DATA_PATH="/media/huanglab/HuangLab10TB/slam_team/dataset/Replica"
PERTURBED_PATH="/media/huanglab/HuangLab10TB/slam_team/dataset/Replica-Dataset-Traj-Perturbed_simple"

ROT=("0" "1" "3" "5")
TRANS=("0" "0dot05" "0dot025" "0dot0125")

# ==== Mono ====
RESULT_PATH="/media/huanglab/HuangLab10TB/slam_team/sibo/results_replica/perturb_trajectory/mono1/"

for ri in ${ROT[*]};
do

for ti in ${TRANS[*]};
do

for n in {0..4};
do
    echo "Office $n with rot ${ri} trans ${ti}"

    rosrun ORB_SLAM3 Mono $ORB_PATH/Vocabulary/ORBvoc.txt $DATA_PATH/cam.yaml & 
    ORB_PID=$!

    python perturb_image.py $PERTURBED_PATH/Replica_office_${n}_rot_${ri}_tran_${ti}_normal/results/ $DATA_PATH/timestamp_20hz.txt --method=none --severity=0 &
    IMG_PID=$!
    wait $IMG_PID

    sleep 1s
    rosnode kill /Mono
    sleep 3s

    mv KeyFrameTrajectory.txt $RESULT_PATH/office${n}_rot_${ri}_trans_${ti}.txt
    mv NumFeatures.txt $RESULT_PATH/keypoints/office${n}_rot_${ri}_trans_${ti}_feats.txt
    sleep 1s
done # n office squences

for n in {0..2};
do
    echo "Room $n with rot ${ri} trans ${ti}"

    rosrun ORB_SLAM3 Mono $ORB_PATH/Vocabulary/ORBvoc.txt $DATA_PATH/cam.yaml & 
    ORB_PID=$!

    python perturb_image.py $PERTURBED_PATH/Replica_room_${n}_rot_${ri}_tran_${ti}_normal/results/ $DATA_PATH/timestamp_20hz.txt --method=none --severity=0 &
    IMG_PID=$!
    wait $IMG_PID

    sleep 1s
    rosnode kill /Mono
    sleep 3s

    mv KeyFrameTrajectory.txt $RESULT_PATH/room${n}_rot_${ri}_trans_${ti}.txt
    mv NumFeatures.txt $RESULT_PATH/keypoints/room${n}_rot_${ri}_trans_${ti}_feats.txt
    sleep 1s
done # n room sequences

done # trans

done # rot


# ==== RGBD ====
RESULT_PATH="/media/huanglab/HuangLab10TB/slam_team/sibo/results_replica/perturb_trajectory/rgbd1/"

for ri in ${ROT[*]};
do

for ti in ${TRANS[*]};
do

for n in {0..4};
do
    echo "Office $n with rot ${ri} trans ${ti}"

    rosrun ORB_SLAM3 RGBD $ORB_PATH/Vocabulary/ORBvoc.txt $DATA_PATH/cam.yaml & 
    ORB_PID=$!

    python perturb_images_new.py $PERTURBED_PATH/Replica_office_${n}_rot_${ri}_tran_${ti}_normal/results/ $DATA_PATH/timestamp_20hz.txt --depth_path=$PERTURBED_PATH/Replica_office_${n}_rot_${ri}_trans_${ti}/results/ --method=none --severity=0 &
    IMG_PID=$!
    wait $IMG_PID

    sleep 1s
    rosnode kill /RGBD
    sleep 3s

    mv KeyFrameTrajectory.txt $RESULT_PATH/office${n}_rot_${ri}_trans_${ti}.txt
    mv NumFeatures.txt $RESULT_PATH/keypoints/office${n}_rot_${ri}_trans_${ti}_feats.txt
    sleep 1s
done # n office squences

for n in {0..2};
do
    echo "Room $n with rot ${ri} trans ${ti}"

    rosrun ORB_SLAM3 RGBD $ORB_PATH/Vocabulary/ORBvoc.txt $DATA_PATH/cam.yaml & 
    ORB_PID=$!

    python perturb_images_new.py $PERTURBED_PATH/Replica_room_${n}_rot_${ri}_tran_${ti}_normal/results/ $DATA_PATH/timestamp_20hz.txt --depth_path=$PERTURBED_PATH/Replica_room_${n}_rot_${ri}_tran_${ti}_normal/results/ --method=none --severity=0 &
    IMG_PID=$!
    wait $IMG_PID

    sleep 1s
    rosnode kill /RGBD
    sleep 3s

    mv KeyFrameTrajectory.txt $RESULT_PATH/room${n}_rot_${ri}_trans_${ti}.txt
    mv NumFeatures.txt $RESULT_PATH/keypoints/room${n}_rot_${ri}_trans_${ti}_feats.txt
    sleep 1s
done # n room sequences

done # trans

done # rot

