#!/bin/bash

MODE="rgbd"
OUT_DIR="/path/to/output_directory"

echo "Running on office0 with severity 5 and downsample 1..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_18_5_1_1" --perturb_type 18 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office0_18_5_1_1 done!"

echo "Running on office0 with severity 10 and downsample 1..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_18_10_1_1" --perturb_type 18 --perturb_severity 10 --frame_downsample 1 --perturb_dynamic 1
echo "office0_18_10_1_1 done!"

echo "Running on office0 with severity 20 and downsample 1..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_18_20_1_1" --perturb_type 18 --perturb_severity 20 --frame_downsample 1 --perturb_dynamic 1
echo "office0_18_20_1_1 done!"

echo "Running on office1 with severity 5 and downsample 1..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_18_5_1_1" --perturb_type 18 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office1_18_5_1_1 done!"

echo "Running on office1 with severity 10 and downsample 1..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_18_10_1_1" --perturb_type 18 --perturb_severity 10 --frame_downsample 1 --perturb_dynamic 1
echo "office1_18_10_1_1 done!"

echo "Running on office1 with severity 20 and downsample 1..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_18_20_1_1" --perturb_type 18 --perturb_severity 20 --frame_downsample 1 --perturb_dynamic 1
echo "office1_18_20_1_1 done!"

echo "Running on office2 with severity 5 and downsample 1..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_18_5_1_1" --perturb_type 18 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office2_18_5_1_1 done!"

echo "Running on office2 with severity 10 and downsample 1..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_18_10_1_1" --perturb_type 18 --perturb_severity 10 --frame_downsample 1 --perturb_dynamic 1
echo "office2_18_10_1_1 done!"

echo "Running on office2 with severity 20 and downsample 1..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_18_20_1_1" --perturb_type 18 --perturb_severity 20 --frame_downsample 1 --perturb_dynamic 1
echo "office2_18_20_1_1 done!"

echo "Running on office3 with severity 5 and downsample 1..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_18_5_1_1" --perturb_type 18 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office3_18_5_1_1 done!"

echo "Running on office3 with severity 10 and downsample 1..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_18_10_1_1" --perturb_type 18 --perturb_severity 10 --frame_downsample 1 --perturb_dynamic 1
echo "office3_18_10_1_1 done!"

echo "Running on office3 with severity 20 and downsample 1..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_18_20_1_1" --perturb_type 18 --perturb_severity 20 --frame_downsample 1 --perturb_dynamic 1
echo "office3_18_20_1_1 done!"

echo "Running on office4 with severity 5 and downsample 1..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_18_5_1_1" --perturb_type 18 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office4_18_5_1_1 done!"

echo "Running on office4 with severity 10 and downsample 1..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_18_10_1_1" --perturb_type 18 --perturb_severity 10 --frame_downsample 1 --perturb_dynamic 1
echo "office4_18_10_1_1 done!"

echo "Running on office4 with severity 20 and downsample 1..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_18_20_1_1" --perturb_type 18 --perturb_severity 20 --frame_downsample 1 --perturb_dynamic 1
echo "office4_18_20_1_1 done!"

echo "Running on room0 with severity 5 and downsample 1..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_18_5_1_1" --perturb_type 18 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room0_18_5_1_1 done!"

echo "Running on room0 with severity 10 and downsample 1..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_18_10_1_1" --perturb_type 18 --perturb_severity 10 --frame_downsample 1 --perturb_dynamic 1
echo "room0_18_10_1_1 done!"

echo "Running on room0 with severity 20 and downsample 1..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_18_20_1_1" --perturb_type 18 --perturb_severity 20 --frame_downsample 1 --perturb_dynamic 1
echo "room0_18_20_1_1 done!"

echo "Running on room1 with severity 5 and downsample 1..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_18_5_1_1" --perturb_type 18 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room1_18_5_1_1 done!"

echo "Running on room1 with severity 10 and downsample 1..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_18_10_1_1" --perturb_type 18 --perturb_severity 10 --frame_downsample 1 --perturb_dynamic 1
echo "room1_18_10_1_1 done!"

echo "Running on room1 with severity 20 and downsample 1..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_18_20_1_1" --perturb_type 18 --perturb_severity 20 --frame_downsample 1 --perturb_dynamic 1
echo "room1_18_20_1_1 done!"

echo "Running on room2 with severity 5 and downsample 1..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_18_5_1_1" --perturb_type 18 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room2_18_5_1_1 done!"

echo "Running on room2 with severity 10 and downsample 1..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_18_10_1_1" --perturb_type 18 --perturb_severity 10 --frame_downsample 1 --perturb_dynamic 1
echo "room2_18_10_1_1 done!"

echo "Running on room2 with severity 20 and downsample 1..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_18_20_1_1" --perturb_type 18 --perturb_severity 20 --frame_downsample 1 --perturb_dynamic 1
echo "room2_18_20_1_1 done!"

echo "All evaluations on the Replica dataset completed."
