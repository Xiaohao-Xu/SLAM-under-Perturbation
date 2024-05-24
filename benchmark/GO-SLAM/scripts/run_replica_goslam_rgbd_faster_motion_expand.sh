#!/bin/bash

MODE="rgbd"
OUT_DIR="/path/to/output_directory"

echo "Running on office0 with severity 5 and downsample 2..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_17_5_0_2" --perturb_type 17 --perturb_severity 5 --frame_downsample 2 --perturb_dynamic 0
echo "office0_17_5_0_2 done!"

echo "Running on office0 with severity 5 and downsample 4..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_17_5_0_4" --perturb_type 17 --perturb_severity 5 --frame_downsample 4 --perturb_dynamic 0
echo "office0_17_5_0_4 done!"

echo "Running on office0 with severity 5 and downsample 8..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_17_5_0_8" --perturb_type 17 --perturb_severity 5 --frame_downsample 8 --perturb_dynamic 0
echo "office0_17_5_0_8 done!"

echo "Running on office0 with severity 5 and downsample 16..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_17_5_0_16" --perturb_type 17 --perturb_severity 5 --frame_downsample 16 --perturb_dynamic 0
echo "office0_17_5_0_16 done!"

echo "Running on office0 with severity 3 and downsample 2..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_17_3_0_2" --perturb_type 17 --perturb_severity 3 --frame_downsample 2 --perturb_dynamic 0
echo "office0_17_3_0_2 done!"

echo "Running on office0 with severity 3 and downsample 4..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_17_3_0_4" --perturb_type 17 --perturb_severity 3 --frame_downsample 4 --perturb_dynamic 0
echo "office0_17_3_0_4 done!"

echo "Running on office0 with severity 3 and downsample 8..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_17_3_0_8" --perturb_type 17 --perturb_severity 3 --frame_downsample 8 --perturb_dynamic 0
echo "office0_17_3_0_8 done!"

echo "Running on office0 with severity 3 and downsample 16..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_17_3_0_16" --perturb_type 17 --perturb_severity 3 --frame_downsample 16 --perturb_dynamic 0
echo "office0_17_3_0_16 done!"

echo "Running on office0 with severity 1 and downsample 2..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_17_1_0_2" --perturb_type 17 --perturb_severity 1 --frame_downsample 2 --perturb_dynamic 0
echo "office0_17_1_0_2 done!"

echo "Running on office0 with severity 1 and downsample 4..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_17_1_0_4" --perturb_type 17 --perturb_severity 1 --frame_downsample 4 --perturb_dynamic 0
echo "office0_17_1_0_4 done!"

echo "Running on office0 with severity 1 and downsample 8..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_17_1_0_8" --perturb_type 17 --perturb_severity 1 --frame_downsample 8 --perturb_dynamic 0
echo "office0_17_1_0_8 done!"

echo "Running on office0 with severity 1 and downsample 16..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_17_1_0_16" --perturb_type 17 --perturb_severity 1 --frame_downsample 16 --perturb_dynamic 0
echo "office0_17_1_0_16 done!"

echo "Running on office1 with severity 5 and downsample 2..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_17_5_0_2" --perturb_type 17 --perturb_severity 5 --frame_downsample 2 --perturb_dynamic 0
echo "office1_17_5_0_2 done!"

echo "Running on office1 with severity 5 and downsample 4..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_17_5_0_4" --perturb_type 17 --perturb_severity 5 --frame_downsample 4 --perturb_dynamic 0
echo "office1_17_5_0_4 done!"

echo "Running on office1 with severity 5 and downsample 8..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_17_5_0_8" --perturb_type 17 --perturb_severity 5 --frame_downsample 8 --perturb_dynamic 0
echo "office1_17_5_0_8 done!"

echo "Running on office1 with severity 5 and downsample 16..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_17_5_0_16" --perturb_type 17 --perturb_severity 5 --frame_downsample 16 --perturb_dynamic 0
echo "office1_17_5_0_16 done!"

echo "Running on office1 with severity 3 and downsample 2..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_17_3_0_2" --perturb_type 17 --perturb_severity 3 --frame_downsample 2 --perturb_dynamic 0
echo "office1_17_3_0_2 done!"

echo "Running on office1 with severity 3 and downsample 4..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_17_3_0_4" --perturb_type 17 --perturb_severity 3 --frame_downsample 4 --perturb_dynamic 0
echo "office1_17_3_0_4 done!"

echo "Running on office1 with severity 3 and downsample 8..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_17_3_0_8" --perturb_type 17 --perturb_severity 3 --frame_downsample 8 --perturb_dynamic 0
echo "office1_17_3_0_8 done!"

echo "Running on office1 with severity 3 and downsample 16..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_17_3_0_16" --perturb_type 17 --perturb_severity 3 --frame_downsample 16 --perturb_dynamic 0
echo "office1_17_3_0_16 done!"

echo "Running on office1 with severity 1 and downsample 2..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_17_1_0_2" --perturb_type 17 --perturb_severity 1 --frame_downsample 2 --perturb_dynamic 0
echo "office1_17_1_0_2 done!"

echo "Running on office1 with severity 1 and downsample 4..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_17_1_0_4" --perturb_type 17 --perturb_severity 1 --frame_downsample 4 --perturb_dynamic 0
echo "office1_17_1_0_4 done!"

echo "Running on office1 with severity 1 and downsample 8..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_17_1_0_8" --perturb_type 17 --perturb_severity 1 --frame_downsample 8 --perturb_dynamic 0
echo "office1_17_1_0_8 done!"

echo "Running on office1 with severity 1 and downsample 16..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_17_1_0_16" --perturb_type 17 --perturb_severity 1 --frame_downsample 16 --perturb_dynamic 0
echo "office1_17_1_0_16 done!"

echo "Running on office2 with severity 5 and downsample 2..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_17_5_0_2" --perturb_type 17 --perturb_severity 5 --frame_downsample 2 --perturb_dynamic 0
echo "office2_17_5_0_2 done!"

echo "Running on office2 with severity 5 and downsample 4..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_17_5_0_4" --perturb_type 17 --perturb_severity 5 --frame_downsample 4 --perturb_dynamic 0
echo "office2_17_5_0_4 done!"

echo "Running on office2 with severity 5 and downsample 8..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_17_5_0_8" --perturb_type 17 --perturb_severity 5 --frame_downsample 8 --perturb_dynamic 0
echo "office2_17_5_0_8 done!"

echo "Running on office2 with severity 5 and downsample 16..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_17_5_0_16" --perturb_type 17 --perturb_severity 5 --frame_downsample 16 --perturb_dynamic 0
echo "office2_17_5_0_16 done!"

echo "Running on office2 with severity 3 and downsample 2..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_17_3_0_2" --perturb_type 17 --perturb_severity 3 --frame_downsample 2 --perturb_dynamic 0
echo "office2_17_3_0_2 done!"

echo "Running on office2 with severity 3 and downsample 4..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_17_3_0_4" --perturb_type 17 --perturb_severity 3 --frame_downsample 4 --perturb_dynamic 0
echo "office2_17_3_0_4 done!"

echo "Running on office2 with severity 3 and downsample 8..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_17_3_0_8" --perturb_type 17 --perturb_severity 3 --frame_downsample 8 --perturb_dynamic 0
echo "office2_17_3_0_8 done!"

echo "Running on office2 with severity 3 and downsample 16..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_17_3_0_16" --perturb_type 17 --perturb_severity 3 --frame_downsample 16 --perturb_dynamic 0
echo "office2_17_3_0_16 done!"

echo "Running on office2 with severity 1 and downsample 2..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_17_1_0_2" --perturb_type 17 --perturb_severity 1 --frame_downsample 2 --perturb_dynamic 0
echo "office2_17_1_0_2 done!"

echo "Running on office2 with severity 1 and downsample 4..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_17_1_0_4" --perturb_type 17 --perturb_severity 1 --frame_downsample 4 --perturb_dynamic 0
echo "office2_17_1_0_4 done!"

echo "Running on office2 with severity 1 and downsample 8..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_17_1_0_8" --perturb_type 17 --perturb_severity 1 --frame_downsample 8 --perturb_dynamic 0
echo "office2_17_1_0_8 done!"

echo "Running on office2 with severity 1 and downsample 16..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_17_1_0_16" --perturb_type 17 --perturb_severity 1 --frame_downsample 16 --perturb_dynamic 0
echo "office2_17_1_0_16 done!"

echo "Running on office3 with severity 5 and downsample 2..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_17_5_0_2" --perturb_type 17 --perturb_severity 5 --frame_downsample 2 --perturb_dynamic 0
echo "office3_17_5_0_2 done!"

echo "Running on office3 with severity 5 and downsample 4..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_17_5_0_4" --perturb_type 17 --perturb_severity 5 --frame_downsample 4 --perturb_dynamic 0
echo "office3_17_5_0_4 done!"

echo "Running on office3 with severity 5 and downsample 8..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_17_5_0_8" --perturb_type 17 --perturb_severity 5 --frame_downsample 8 --perturb_dynamic 0
echo "office3_17_5_0_8 done!"

echo "Running on office3 with severity 5 and downsample 16..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_17_5_0_16" --perturb_type 17 --perturb_severity 5 --frame_downsample 16 --perturb_dynamic 0
echo "office3_17_5_0_16 done!"

echo "Running on office3 with severity 3 and downsample 2..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_17_3_0_2" --perturb_type 17 --perturb_severity 3 --frame_downsample 2 --perturb_dynamic 0
echo "office3_17_3_0_2 done!"

echo "Running on office3 with severity 3 and downsample 4..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_17_3_0_4" --perturb_type 17 --perturb_severity 3 --frame_downsample 4 --perturb_dynamic 0
echo "office3_17_3_0_4 done!"

echo "Running on office3 with severity 3 and downsample 8..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_17_3_0_8" --perturb_type 17 --perturb_severity 3 --frame_downsample 8 --perturb_dynamic 0
echo "office3_17_3_0_8 done!"

echo "Running on office3 with severity 3 and downsample 16..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_17_3_0_16" --perturb_type 17 --perturb_severity 3 --frame_downsample 16 --perturb_dynamic 0
echo "office3_17_3_0_16 done!"

echo "Running on office3 with severity 1 and downsample 2..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_17_1_0_2" --perturb_type 17 --perturb_severity 1 --frame_downsample 2 --perturb_dynamic 0
echo "office3_17_1_0_2 done!"

echo "Running on office3 with severity 1 and downsample 4..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_17_1_0_4" --perturb_type 17 --perturb_severity 1 --frame_downsample 4 --perturb_dynamic 0
echo "office3_17_1_0_4 done!"

echo "Running on office3 with severity 1 and downsample 8..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_17_1_0_8" --perturb_type 17 --perturb_severity 1 --frame_downsample 8 --perturb_dynamic 0
echo "office3_17_1_0_8 done!"

echo "Running on office3 with severity 1 and downsample 16..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_17_1_0_16" --perturb_type 17 --perturb_severity 1 --frame_downsample 16 --perturb_dynamic 0
echo "office3_17_1_0_16 done!"

echo "Running on office4 with severity 5 and downsample 2..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_17_5_0_2" --perturb_type 17 --perturb_severity 5 --frame_downsample 2 --perturb_dynamic 0
echo "office4_17_5_0_2 done!"

echo "Running on office4 with severity 5 and downsample 4..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_17_5_0_4" --perturb_type 17 --perturb_severity 5 --frame_downsample 4 --perturb_dynamic 0
echo "office4_17_5_0_4 done!"

echo "Running on office4 with severity 5 and downsample 8..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_17_5_0_8" --perturb_type 17 --perturb_severity 5 --frame_downsample 8 --perturb_dynamic 0
echo "office4_17_5_0_8 done!"

echo "Running on office4 with severity 5 and downsample 16..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_17_5_0_16" --perturb_type 17 --perturb_severity 5 --frame_downsample 16 --perturb_dynamic 0
echo "office4_17_5_0_16 done!"

echo "Running on office4 with severity 3 and downsample 2..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_17_3_0_2" --perturb_type 17 --perturb_severity 3 --frame_downsample 2 --perturb_dynamic 0
echo "office4_17_3_0_2 done!"

echo "Running on office4 with severity 3 and downsample 4..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_17_3_0_4" --perturb_type 17 --perturb_severity 3 --frame_downsample 4 --perturb_dynamic 0
echo "office4_17_3_0_4 done!"

echo "Running on office4 with severity 3 and downsample 8..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_17_3_0_8" --perturb_type 17 --perturb_severity 3 --frame_downsample 8 --perturb_dynamic 0
echo "office4_17_3_0_8 done!"

echo "Running on office4 with severity 3 and downsample 16..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_17_3_0_16" --perturb_type 17 --perturb_severity 3 --frame_downsample 16 --perturb_dynamic 0
echo "office4_17_3_0_16 done!"

echo "Running on office4 with severity 1 and downsample 2..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_17_1_0_2" --perturb_type 17 --perturb_severity 1 --frame_downsample 2 --perturb_dynamic 0
echo "office4_17_1_0_2 done!"

echo "Running on office4 with severity 1 and downsample 4..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_17_1_0_4" --perturb_type 17 --perturb_severity 1 --frame_downsample 4 --perturb_dynamic 0
echo "office4_17_1_0_4 done!"

echo "Running on office4 with severity 1 and downsample 8..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_17_1_0_8" --perturb_type 17 --perturb_severity 1 --frame_downsample 8 --perturb_dynamic 0
echo "office4_17_1_0_8 done!"

echo "Running on office4 with severity 1 and downsample 16..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_17_1_0_16" --perturb_type 17 --perturb_severity 1 --frame_downsample 16 --perturb_dynamic 0
echo "office4_17_1_0_16 done!"

echo "Running on room0 with severity 5 and downsample 2..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_17_5_0_2" --perturb_type 17 --perturb_severity 5 --frame_downsample 2 --perturb_dynamic 0
echo "room0_17_5_0_2 done!"

echo "Running on room0 with severity 5 and downsample 4..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_17_5_0_4" --perturb_type 17 --perturb_severity 5 --frame_downsample 4 --perturb_dynamic 0
echo "room0_17_5_0_4 done!"

echo "Running on room0 with severity 5 and downsample 8..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_17_5_0_8" --perturb_type 17 --perturb_severity 5 --frame_downsample 8 --perturb_dynamic 0
echo "room0_17_5_0_8 done!"

echo "Running on room0 with severity 5 and downsample 16..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_17_5_0_16" --perturb_type 17 --perturb_severity 5 --frame_downsample 16 --perturb_dynamic 0
echo "room0_17_5_0_16 done!"

echo "Running on room0 with severity 3 and downsample 2..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_17_3_0_2" --perturb_type 17 --perturb_severity 3 --frame_downsample 2 --perturb_dynamic 0
echo "room0_17_3_0_2 done!"

echo "Running on room0 with severity 3 and downsample 4..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_17_3_0_4" --perturb_type 17 --perturb_severity 3 --frame_downsample 4 --perturb_dynamic 0
echo "room0_17_3_0_4 done!"

echo "Running on room0 with severity 3 and downsample 8..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_17_3_0_8" --perturb_type 17 --perturb_severity 3 --frame_downsample 8 --perturb_dynamic 0
echo "room0_17_3_0_8 done!"

echo "Running on room0 with severity 3 and downsample 16..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_17_3_0_16" --perturb_type 17 --perturb_severity 3 --frame_downsample 16 --perturb_dynamic 0
echo "room0_17_3_0_16 done!"

echo "Running on room0 with severity 1 and downsample 2..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_17_1_0_2" --perturb_type 17 --perturb_severity 1 --frame_downsample 2 --perturb_dynamic 0
echo "room0_17_1_0_2 done!"

echo "Running on room0 with severity 1 and downsample 4..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_17_1_0_4" --perturb_type 17 --perturb_severity 1 --frame_downsample 4 --perturb_dynamic 0
echo "room0_17_1_0_4 done!"

echo "Running on room0 with severity 1 and downsample 8..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_17_1_0_8" --perturb_type 17 --perturb_severity 1 --frame_downsample 8 --perturb_dynamic 0
echo "room0_17_1_0_8 done!"

echo "Running on room0 with severity 1 and downsample 16..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_17_1_0_16" --perturb_type 17 --perturb_severity 1 --frame_downsample 16 --perturb_dynamic 0
echo "room0_17_1_0_16 done!"

echo "Running on room1 with severity 5 and downsample 2..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_17_5_0_2" --perturb_type 17 --perturb_severity 5 --frame_downsample 2 --perturb_dynamic 0
echo "room1_17_5_0_2 done!"

echo "Running on room1 with severity 5 and downsample 4..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_17_5_0_4" --perturb_type 17 --perturb_severity 5 --frame_downsample 4 --perturb_dynamic 0
echo "room1_17_5_0_4 done!"

echo "Running on room1 with severity 5 and downsample 8..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_17_5_0_8" --perturb_type 17 --perturb_severity 5 --frame_downsample 8 --perturb_dynamic 0
echo "room1_17_5_0_8 done!"

echo "Running on room1 with severity 5 and downsample 16..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_17_5_0_16" --perturb_type 17 --perturb_severity 5 --frame_downsample 16 --perturb_dynamic 0
echo "room1_17_5_0_16 done!"

echo "Running on room1 with severity 3 and downsample 2..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_17_3_0_2" --perturb_type 17 --perturb_severity 3 --frame_downsample 2 --perturb_dynamic 0
echo "room1_17_3_0_2 done!"

echo "Running on room1 with severity 3 and downsample 4..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_17_3_0_4" --perturb_type 17 --perturb_severity 3 --frame_downsample 4 --perturb_dynamic 0
echo "room1_17_3_0_4 done!"

echo "Running on room1 with severity 3 and downsample 8..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_17_3_0_8" --perturb_type 17 --perturb_severity 3 --frame_downsample 8 --perturb_dynamic 0
echo "room1_17_3_0_8 done!"

echo "Running on room1 with severity 3 and downsample 16..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_17_3_0_16" --perturb_type 17 --perturb_severity 3 --frame_downsample 16 --perturb_dynamic 0
echo "room1_17_3_0_16 done!"

echo "Running on room1 with severity 1 and downsample 2..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_17_1_0_2" --perturb_type 17 --perturb_severity 1 --frame_downsample 2 --perturb_dynamic 0
echo "room1_17_1_0_2 done!"

echo "Running on room1 with severity 1 and downsample 4..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_17_1_0_4" --perturb_type 17 --perturb_severity 1 --frame_downsample 4 --perturb_dynamic 0
echo "room1_17_1_0_4 done!"

echo "Running on room1 with severity 1 and downsample 8..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_17_1_0_8" --perturb_type 17 --perturb_severity 1 --frame_downsample 8 --perturb_dynamic 0
echo "room1_17_1_0_8 done!"

echo "Running on room1 with severity 1 and downsample 16..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_17_1_0_16" --perturb_type 17 --perturb_severity 1 --frame_downsample 16 --perturb_dynamic 0
echo "room1_17_1_0_16 done!"

echo "Running on room2 with severity 5 and downsample 2..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_17_5_0_2" --perturb_type 17 --perturb_severity 5 --frame_downsample 2 --perturb_dynamic 0
echo "room2_17_5_0_2 done!"

echo "Running on room2 with severity 5 and downsample 4..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_17_5_0_4" --perturb_type 17 --perturb_severity 5 --frame_downsample 4 --perturb_dynamic 0
echo "room2_17_5_0_4 done!"

echo "Running on room2 with severity 5 and downsample 8..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_17_5_0_8" --perturb_type 17 --perturb_severity 5 --frame_downsample 8 --perturb_dynamic 0
echo "room2_17_5_0_8 done!"

echo "Running on room2 with severity 5 and downsample 16..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_17_5_0_16" --perturb_type 17 --perturb_severity 5 --frame_downsample 16 --perturb_dynamic 0
echo "room2_17_5_0_16 done!"

echo "Running on room2 with severity 3 and downsample 2..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_17_3_0_2" --perturb_type 17 --perturb_severity 3 --frame_downsample 2 --perturb_dynamic 0
echo "room2_17_3_0_2 done!"

echo "Running on room2 with severity 3 and downsample 4..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_17_3_0_4" --perturb_type 17 --perturb_severity 3 --frame_downsample 4 --perturb_dynamic 0
echo "room2_17_3_0_4 done!"

echo "Running on room2 with severity 3 and downsample 8..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_17_3_0_8" --perturb_type 17 --perturb_severity 3 --frame_downsample 8 --perturb_dynamic 0
echo "room2_17_3_0_8 done!"

echo "Running on room2 with severity 3 and downsample 16..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_17_3_0_16" --perturb_type 17 --perturb_severity 3 --frame_downsample 16 --perturb_dynamic 0
echo "room2_17_3_0_16 done!"

echo "Running on room2 with severity 1 and downsample 2..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_17_1_0_2" --perturb_type 17 --perturb_severity 1 --frame_downsample 2 --perturb_dynamic 0
echo "room2_17_1_0_2 done!"

echo "Running on room2 with severity 1 and downsample 4..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_17_1_0_4" --perturb_type 17 --perturb_severity 1 --frame_downsample 4 --perturb_dynamic 0
echo "room2_17_1_0_4 done!"

echo "Running on room2 with severity 1 and downsample 8..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_17_1_0_8" --perturb_type 17 --perturb_severity 1 --frame_downsample 8 --perturb_dynamic 0
echo "room2_17_1_0_8 done!"

echo "Running on room2 with severity 1 and downsample 16..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_17_1_0_16" --perturb_type 17 --perturb_severity 1 --frame_downsample 16 --perturb_dynamic 0
echo "room2_17_1_0_16 done!"

echo "All evaluations on the Replica dataset completed."
