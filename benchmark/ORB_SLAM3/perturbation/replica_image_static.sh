#!/bin/bash
ORB_PATH="../"
DATA_PATH="/media/huanglab/HuangLab10TB/slam_team/dataset/Replica"
RESULT_PATH="/media/huanglab/HuangLab10TB/slam_team/sibo/results_replica/rgbd/rgbd1_image_perturbation/"

# "motion_blur" and "glass_blur" require longer times to be perturbed
# recommend save first and re-use 
# METHODS=("gaussian_noise" "shot_noise" "impulse_noise" "speckle_noise" "gaussian_blur" "defocus_blur" "fog" "frost" "contrast" "brightness" "motion_blur" "glass_blur" "snow" "spatter" "jpeg_compression" "pixelate")
METHODS=("gaussian_noise" "shot_noise" "impulse_noise" "speckle_noise" "gaussian_blur" "defocus_blur" "fog" "frost" "contrast" "brightness" "snow" "spatter" "jpeg_compression" "pixelate")

# RGBD
for k in {1..5..2};
do

for m in ${METHODS[*]};
do

for n in {0..4};
do
    echo "Office $n with level $k"

    rosrun ORB_SLAM3 RGBD $ORB_PATH/Vocabulary/ORBvoc.txt $DATA_PATH/cam.yaml & 
    ORB_PID=$!

    python perturb_image.py $DATA_PATH/office${n}/frame/ $DATA_PATH/timestamp_20hz.txt --depth_path=$DATA_PATH/office${n}/depth/ --method=${m} --severity=${k} &
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

    python perturb_image.py $DATA_PATH/room${n}/frame/ $DATA_PATH/timestamp_20hz.txt --depth_path=$DATA_PATH/room${n}/depth/ --method=${m} --severity=${k} &
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

# RGBD clean
# Clean
for n in {0..4};
do
    echo "Office $n"

    rosrun ORB_SLAM3 RGBD $ORB_PATH/Vocabulary/ORBvoc.txt $DATA_PATH/cam.yaml & 
    ORB_PID=$!

    python perturb_image.py $DATA_PATH/office${n}/frame/ $DATA_PATH/timestamp_20hz.txt --depth_path=$DATA_PATH/office${n}/depth/ --method=none --severity=1 &
    IMG_PID=$!
    wait $IMG_PID

    sleep 1s
    rosnode kill /RGBD
    sleep 3s

    mv KeyFrameTrajectory.txt $RESULT_PATH/office${n}_none_0.txt
    mv NumFeatures.txt $RESULT_PATH/keypoints/office${n}_none_0_feats.txt
    sleep 1s
done # n office squences

for n in {0..2};
do
    echo "Room $n"

    rosrun ORB_SLAM3 RGBD $ORB_PATH/Vocabulary/ORBvoc.txt $DATA_PATH/cam.yaml & 
    ORB_PID=$!

    python perturb_image.py $DATA_PATH/room${n}/frame/ $DATA_PATH/timestamp_20hz.txt --depth_path=$DATA_PATH/room${n}/depth/ --method=none --severity=1 &
    IMG_PID=$!
    wait $IMG_PID

    sleep 1s
    rosnode kill /RGBD
    sleep 3s

    mv KeyFrameTrajectory.txt $RESULT_PATH/room${n}_none_0.txt
    mv NumFeatures.txt $RESULT_PATH/keypoints/room${n}_none_0_feats.txt
    sleep 1s
done # n room sequences


RESULT_PATH="/media/huanglab/HuangLab10TB/slam_team/sibo/results_replica/mono/mono1_image_perturbation/"

# Mono
for k in {1..5..2};
do

for m in ${METHODS[*]};
do

for n in {0..4};
do
    echo "Office $n with level $k"

    rosrun ORB_SLAM3 Mono $ORB_PATH/Vocabulary/ORBvoc.txt $DATA_PATH/cam.yaml & 
    ORB_PID=$!

    python perturb_image.py $DATA_PATH/office${n}/frame/ $DATA_PATH/timestamp_20hz.txt --method=${m} --severity=${k} &
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

    python perturb_image.py $DATA_PATH/room${n}/frame/ $DATA_PATH/timestamp_20hz.txt --method=${m} --severity=${k} &
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

done # k severity

for n in {0..4};
do
    echo "Office $n"

    rosrun ORB_SLAM3 Mono $ORB_PATH/Vocabulary/ORBvoc.txt $DATA_PATH/cam.yaml & 
    ORB_PID=$!

    python perturb_image.py $DATA_PATH/office${n}/frame/ $DATA_PATH/timestamp_20hz.txt --method=none --severity=1 &
    IMG_PID=$!
    wait $IMG_PID

    sleep 1s
    rosnode kill /Mono
    sleep 3s

    mv KeyFrameTrajectory.txt $RESULT_PATH/office${n}_none_0.txt
    mv NumFeatures.txt $RESULT_PATH/keypoints/office${n}_none_0_feats.txt
    sleep 1s
done # n office squences

for n in {0..2};
do
    echo "Room $n"

    rosrun ORB_SLAM3 Mono $ORB_PATH/Vocabulary/ORBvoc.txt $DATA_PATH/cam.yaml & 
    ORB_PID=$!

    python perturb_image.py $DATA_PATH/room${n}/Frame/ $DATA_PATH/timestamp_20hz.txt --method=none --severity=1 &
    IMG_PID=$!
    wait $IMG_PID

    sleep 1s
    rosnode kill /Mono
    sleep 3s

    mv KeyFrameTrajectory.txt $RESULT_PATH/room${n}_none_0.txt
    mv NumFeatures.txt $RESULT_PATH/keypoints/room${n}_none_0_feats.txt
    sleep 1s
done # n room sequences