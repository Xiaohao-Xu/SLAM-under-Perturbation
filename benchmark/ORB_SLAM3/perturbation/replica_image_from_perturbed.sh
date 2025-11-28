#!/bin/bash
ORB_PATH="../"
DATA_PATH="/media/huanglab/HuangLab10TB/slam_team/dataset/Replica"
PERTURBED_PATH="/media/huanglab/HuangLab10TB/slam_team/dataset/Replica_robustness"

# "motion_blur" and "glass_blur" require longer times to be perturbed
METHODS=("motion_blur" "glass_blur")


# ==== Static ====
RESULT_PATH="/media/huanglab/HuangLab10TB/slam_team/sibo/results_replica/rgbd/rgbd1_image_perturbation/"

for k in {1..5..2};
do

for m in ${METHODS[*]};
do

for n in {0..4};
do
    echo "Office $n with level $k"

    rosrun ORB_SLAM3 RGBD $ORB_PATH/Vocabulary/ORBvoc.txt $DATA_PATH/cam.yaml & 
    ORB_PID=$!
    echo "$PERTURBED_PATH/office${n}/${m}/${k}/"
    echo "$DATA_PATH/office${n}/depth/"
    python perturb_image.py $PERTURBED_PATH/office${n}/${m}/${k}/ $DATA_PATH/timestamp_20hz.txt --depth_path=$DATA_PATH/office${n}/depth/ --method=none --severity=0 &
    IMG_PID=$!
    wait $IMG_PID

    sleep 2s
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

    python perturb_image.py $PERTURBED_PATH/room${n}/${m}/${k}/ $DATA_PATH/timestamp_20hz.txt --depth_path=$DATA_PATH/room${n}/depth/ --method=none --severity=0 &
    IMG_PID=$!
    wait $IMG_PID

    sleep 2s
    rosnode kill /RGBD
    sleep 3s

    mv KeyFrameTrajectory.txt $RESULT_PATH/room${n}_${m}_${k}.txt
    mv NumFeatures.txt $RESULT_PATH/keypoints/room${n}_${m}_${k}_feats.txt
    sleep 1s
done # n room sequences

done # METHODS

done # k levels


RESULT_PATH="/media/huanglab/HuangLab10TB/slam_team/sibo/results_replica/mono/mono1_image_perturbation/"

for m in ${METHODS[*]};
do

for n in {0..4};
do
    echo "Office $n with level $k"

    rosrun ORB_SLAM3 Mono $ORB_PATH/Vocabulary/ORBvoc.txt $DATA_PATH/cam.yaml & 
    ORB_PID=$!

    python perturb_image.py $PERTURBED_PATH/office${n}/${m}/${k}/ $DATA_PATH/timestamp_20hz.txt --method=none --severity=0 &
    IMG_PID=$!
    wait $IMG_PID

    sleep 1s
    rosnode kill /Mono
    sleep 3s

    mv KeyFrameTrajectory.txt $RESULT_PATH/office${n}_${m}_${k}.txt
    mv NumFeatures.txt $RESULT_PATH/keypoints/office${n}_${m}_${k}_feats.txt
    sleep 1s
done # n office squences

for n in {0..2};
do
    echo "Room $n with level $k"

    rosrun ORB_SLAM3 Mono $ORB_PATH/Vocabulary/ORBvoc.txt $DATA_PATH/cam.yaml & 
    ORB_PID=$!

    python perturb_image.py $PERTURBED_PATH/room${n}/${m}/${k}/ $DATA_PATH/timestamp_20hz.txt --method=none --severity=0 &
    IMG_PID=$!
    wait $IMG_PID

    sleep 1s
    rosnode kill /Mono
    sleep 3s

    mv KeyFrameTrajectory.txt $RESULT_PATH/room${n}_${m}_${k}.txt
    mv NumFeatures.txt $RESULT_PATH/keypoints/room${n}_${m}_${k}_feats.txt
    sleep 1s
done # n room sequences

done # METHODS


# ==== Dynamic ====
RESULT_PATH="/media/huanglab/HuangLab10TB/slam_team/sibo/results_replica/rgbd/rgbd1_dyn_image_perturbation/"

for m in ${METHODS[*]};
do

for n in {0..4};
do
    echo "Office $n with level $k"

    rosrun ORB_SLAM3 RGBD $ORB_PATH/Vocabulary/ORBvoc.txt $DATA_PATH/cam.yaml & 
    ORB_PID=$!
    echo "$PERTURBED_PATH/office${n}/${m}/${k}/"
    echo "$DATA_PATH/office${n}/depth/"
    
    python perturb_image.py $PERTURBED_PATH/office${n}/${m}/${k}/ $DATA_PATH/timestamp_20hz.txt --depth_path=$DATA_PATH/office${n}/depth/ --method=none --severity=0 &
    IMG_PID=$!
    wait $IMG_PID

    sleep 2s
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

    python perturb_image.py $PERTURBED_PATH/room${n}/${m}/${k}/ $DATA_PATH/timestamp_20hz.txt --depth_path=$DATA_PATH/room${n}/depth/ --method=none --severity=0 &
    IMG_PID=$!
    wait $IMG_PID

    sleep 2s
    rosnode kill /RGBD
    sleep 3s

    mv KeyFrameTrajectory.txt $RESULT_PATH/room${n}_${m}_${k}.txt
    mv NumFeatures.txt $RESULT_PATH/keypoints/room${n}_${m}_${k}_feats.txt
    sleep 1s
done # n room sequences

done # METHODS

done # k levels


RESULT_PATH="/media/huanglab/HuangLab10TB/slam_team/sibo/results_replica/mono/mono1_image_perturbation/"

for m in ${METHODS[*]};
do

for n in {0..4};
do
    echo "Office $n with level $k"

    rosrun ORB_SLAM3 Mono $ORB_PATH/Vocabulary/ORBvoc.txt $DATA_PATH/cam.yaml & 
    ORB_PID=$!

    python perturb_image.py $PERTURBED_PATH/office${n}/${m}/${k}/ $DATA_PATH/timestamp_20hz.txt --method=none --severity=0 &
    IMG_PID=$!
    wait $IMG_PID

    sleep 1s
    rosnode kill /Mono
    sleep 3s

    mv KeyFrameTrajectory.txt $RESULT_PATH/office${n}_${m}_${k}.txt
    mv NumFeatures.txt $RESULT_PATH/keypoints/office${n}_${m}_${k}_feats.txt
    sleep 1s
done # n office squences

for n in {0..2};
do
    echo "Room $n with level $k"

    rosrun ORB_SLAM3 Mono $ORB_PATH/Vocabulary/ORBvoc.txt $DATA_PATH/cam.yaml & 
    ORB_PID=$!

    python perturb_image.py $PERTURBED_PATH/room${n}/${m}/${k}/ $DATA_PATH/timestamp_20hz.txt --method=none --severity=0 &
    IMG_PID=$!
    wait $IMG_PID

    sleep 1s
    rosnode kill /Mono
    sleep 3s

    mv KeyFrameTrajectory.txt $RESULT_PATH/room${n}_${m}_${k}.txt
    mv NumFeatures.txt $RESULT_PATH/keypoints/room${n}_${m}_${k}_feats.txt
    sleep 1s
done # n room sequences

done # METHODS

