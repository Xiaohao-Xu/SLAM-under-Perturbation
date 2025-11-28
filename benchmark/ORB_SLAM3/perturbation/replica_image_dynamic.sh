#!/bin/bash
ORB_PATH="../"
DATA_PATH="/media/huanglab/HuangLab10TB/slam_team/dataset/Replica"

# "motion_blur" and "glass_blur" require longer times to be perturbed
# METHODS=("gaussian_noise" "shot_noise" "impulse_noise" "speckle_noise" "gaussian_blur" "defocus_blur" "fog" "frost" "contrast" "brightness" "motion_blur" "glass_blur" "snow" "spatter" "jpeg_compression" "pixelate")
METHODS=("gaussian_noise" "shot_noise" "impulse_noise" "speckle_noise" "gaussian_blur" "defocus_blur" "fog" "frost" "contrast" "brightness" "snow" "spatter" "jpeg_compression" "pixelate")

RESULT_PATH="/media/huanglab/HuangLab10TB/slam_team/sibo/results_replica/rgbd/rgbd1_dyn_image_perturbation/"

for m in ${METHODS[*]};
do

for n in {0..4};
do
    echo "Office $n with level $k"

    rosrun ORB_SLAM3 RGBD $ORB_PATH/Vocabulary/ORBvoc.txt $DATA_PATH/cam.yaml & 
    ORB_PID=$!

    python perturb_image.py $DATA_PATH/office${n}/frame/ $DATA_PATH/timestamp_20hz.txt --depth_path=$DATA_PATH/office${n}/depth/ --method=${m} --severity=99 &
    IMG_PID=$!
    wait $IMG_PID

    sleep 1s
    rosnode kill /RGBD
    sleep 3s

    mv KeyFrameTrajectory.txt $RESULT_PATH/office${n}_${m}_rand.txt
    mv NumFeatures.txt $RESULT_PATH/keypoints/office${n}_${m}_rand_feats.txt
    sleep 1s
done # n office squences

for n in {0..2};
do
    echo "Room $n with level $k"

    rosrun ORB_SLAM3 RGBD $ORB_PATH/Vocabulary/ORBvoc.txt $DATA_PATH/cam.yaml & 
    ORB_PID=$!

    python perturb_image.py $DATA_PATH/room${n}/results/ $DATA_PATH/timestamp_20hz.txt --depth_path=$DATA_PATH/room${n}/depth/ --method=${m} --severity=99 &
    IMG_PID=$!
    wait $IMG_PID

    sleep 1s
    rosnode kill /RGBD
    sleep 3s

    mv KeyFrameTrajectory.txt $RESULT_PATH/room${n}_${m}_rand.txt
    mv NumFeatures.txt $RESULT_PATH/keypoints/room${n}_${m}_rand_feats.txt
    sleep 1s
done # n room sequences

done # METHODS


RESULT_PATH="/media/huanglab/HuangLab10TB/slam_team/sibo/results_replica/mono/mono1_dyn_image_perturbation/"

for m in ${METHODS[*]};
do

for n in {0..4};
do
    echo "Office $n with level $k"

    rosrun ORB_SLAM3 Mono $ORB_PATH/Vocabulary/ORBvoc.txt $DATA_PATH/cam.yaml & 
    ORB_PID=$!

    python perturb_image.py $DATA_PATH/office${n}/frame/ $DATA_PATH/timestamp_20hz.txt --method=${m} --severity=99 &
    IMG_PID=$!
    wait $IMG_PID

    sleep 1s
    rosnode kill /Mono
    sleep 3s

    mv KeyFrameTrajectory.txt $RESULT_PATH/office${n}_${m}_rand.txt
    mv NumFeatures.txt $RESULT_PATH/keypoints/office${n}_${m}_rand_feats.txt
    sleep 1s
done # n office squences

for n in {0..2};
do
    echo "Room $n with level $k"

    rosrun ORB_SLAM3 Mono $ORB_PATH/Vocabulary/ORBvoc.txt $DATA_PATH/cam.yaml & 
    ORB_PID=$!

    python perturb_image.py $DATA_PATH/room${n}/frame/ $DATA_PATH/timestamp_20hz.txt --method=${m} --severity=99 &
    IMG_PID=$!
    wait $IMG_PID

    sleep 1s
    rosnode kill /Mono
    sleep 3s

    mv KeyFrameTrajectory.txt $RESULT_PATH/room${n}_${m}_rand.txt
    mv NumFeatures.txt $RESULT_PATH/keypoints/room${n}_${m}_rand_feats.txt
    sleep 1s
done # n room sequences

done # METHODS
