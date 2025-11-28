#!/bin/bash

MODE="rgbd"
OUT_DIR="/path/to/output_directory"

echo "Start evaluating on the Replica dataset..."
echo "Running on office0 with perturbation type 0 and severity 5..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_0_5_1_1" --perturb_type 0 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office0_0_5_1_1 done!"

echo "Running on office0 with perturbation type 1 and severity 5..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_1_5_1_1" --perturb_type 1 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office0_1_5_1_1 done!"

echo "Running on office0 with perturbation type 2 and severity 5..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_2_5_1_1" --perturb_type 2 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office0_2_5_1_1 done!"

echo "Running on office0 with perturbation type 3 and severity 5..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_3_5_1_1" --perturb_type 3 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office0_3_5_1_1 done!"

echo "Running on office0 with perturbation type 4 and severity 5..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_4_5_1_1" --perturb_type 4 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office0_4_5_1_1 done!"

echo "Running on office0 with perturbation type 5 and severity 5..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_5_5_1_1" --perturb_type 5 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office0_5_5_1_1 done!"

echo "Running on office0 with perturbation type 6 and severity 5..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_6_5_1_1" --perturb_type 6 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office0_6_5_1_1 done!"

echo "Running on office0 with perturbation type 7 and severity 5..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_7_5_1_1" --perturb_type 7 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office0_7_5_1_1 done!"

echo "Running on office0 with perturbation type 8 and severity 5..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_8_5_1_1" --perturb_type 8 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office0_8_5_1_1 done!"

echo "Running on office0 with perturbation type 9 and severity 5..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_9_5_1_1" --perturb_type 9 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office0_9_5_1_1 done!"

echo "Running on office0 with perturbation type 10 and severity 5..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_10_5_1_1" --perturb_type 10 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office0_10_5_1_1 done!"

echo "Running on office0 with perturbation type 11 and severity 5..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_11_5_1_1" --perturb_type 11 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office0_11_5_1_1 done!"

echo "Running on office0 with perturbation type 12 and severity 5..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_12_5_1_1" --perturb_type 12 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office0_12_5_1_1 done!"

echo "Running on office0 with perturbation type 13 and severity 5..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_13_5_1_1" --perturb_type 13 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office0_13_5_1_1 done!"

echo "Running on office0 with perturbation type 14 and severity 5..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_14_5_1_1" --perturb_type 14 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office0_14_5_1_1 done!"

echo "Running on office0 with perturbation type 15 and severity 5..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_15_5_1_1" --perturb_type 15 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office0_15_5_1_1 done!"

echo "Running on office0 with perturbation type 16 and severity 5..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_16_5_1_1" --perturb_type 16 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office0_16_5_1_1 done!"

echo "Running on office0 with perturbation type 17 and severity 5..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_17_5_1_1" --perturb_type 17 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office0_17_5_1_1 done!"

echo "Running on office0 with perturbation type 0 and severity 3..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_0_3_1_1" --perturb_type 0 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office0_0_3_1_1 done!"

echo "Running on office0 with perturbation type 1 and severity 3..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_1_3_1_1" --perturb_type 1 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office0_1_3_1_1 done!"

echo "Running on office0 with perturbation type 2 and severity 3..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_2_3_1_1" --perturb_type 2 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office0_2_3_1_1 done!"

echo "Running on office0 with perturbation type 3 and severity 3..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_3_3_1_1" --perturb_type 3 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office0_3_3_1_1 done!"

echo "Running on office0 with perturbation type 4 and severity 3..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_4_3_1_1" --perturb_type 4 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office0_4_3_1_1 done!"

echo "Running on office0 with perturbation type 5 and severity 3..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_5_3_1_1" --perturb_type 5 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office0_5_3_1_1 done!"

echo "Running on office0 with perturbation type 6 and severity 3..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_6_3_1_1" --perturb_type 6 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office0_6_3_1_1 done!"

echo "Running on office0 with perturbation type 7 and severity 3..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_7_3_1_1" --perturb_type 7 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office0_7_3_1_1 done!"

echo "Running on office0 with perturbation type 8 and severity 3..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_8_3_1_1" --perturb_type 8 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office0_8_3_1_1 done!"

echo "Running on office0 with perturbation type 9 and severity 3..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_9_3_1_1" --perturb_type 9 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office0_9_3_1_1 done!"

echo "Running on office0 with perturbation type 10 and severity 3..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_10_3_1_1" --perturb_type 10 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office0_10_3_1_1 done!"

echo "Running on office0 with perturbation type 11 and severity 3..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_11_3_1_1" --perturb_type 11 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office0_11_3_1_1 done!"

echo "Running on office0 with perturbation type 12 and severity 3..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_12_3_1_1" --perturb_type 12 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office0_12_3_1_1 done!"

echo "Running on office0 with perturbation type 13 and severity 3..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_13_3_1_1" --perturb_type 13 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office0_13_3_1_1 done!"

echo "Running on office0 with perturbation type 14 and severity 3..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_14_3_1_1" --perturb_type 14 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office0_14_3_1_1 done!"

echo "Running on office0 with perturbation type 15 and severity 3..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_15_3_1_1" --perturb_type 15 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office0_15_3_1_1 done!"

echo "Running on office0 with perturbation type 16 and severity 3..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_16_3_1_1" --perturb_type 16 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office0_16_3_1_1 done!"

echo "Running on office0 with perturbation type 17 and severity 3..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_17_3_1_1" --perturb_type 17 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office0_17_3_1_1 done!"

echo "Running on office0 with perturbation type 0 and severity 1..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_0_1_1_1" --perturb_type 0 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office0_0_1_1_1 done!"

echo "Running on office0 with perturbation type 1 and severity 1..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_1_1_1_1" --perturb_type 1 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office0_1_1_1_1 done!"

echo "Running on office0 with perturbation type 2 and severity 1..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_2_1_1_1" --perturb_type 2 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office0_2_1_1_1 done!"

echo "Running on office0 with perturbation type 3 and severity 1..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_3_1_1_1" --perturb_type 3 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office0_3_1_1_1 done!"

echo "Running on office0 with perturbation type 4 and severity 1..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_4_1_1_1" --perturb_type 4 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office0_4_1_1_1 done!"

echo "Running on office0 with perturbation type 5 and severity 1..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_5_1_1_1" --perturb_type 5 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office0_5_1_1_1 done!"

echo "Running on office0 with perturbation type 6 and severity 1..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_6_1_1_1" --perturb_type 6 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office0_6_1_1_1 done!"

echo "Running on office0 with perturbation type 7 and severity 1..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_7_1_1_1" --perturb_type 7 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office0_7_1_1_1 done!"

echo "Running on office0 with perturbation type 8 and severity 1..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_8_1_1_1" --perturb_type 8 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office0_8_1_1_1 done!"

echo "Running on office0 with perturbation type 9 and severity 1..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_9_1_1_1" --perturb_type 9 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office0_9_1_1_1 done!"

echo "Running on office0 with perturbation type 10 and severity 1..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_10_1_1_1" --perturb_type 10 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office0_10_1_1_1 done!"

echo "Running on office0 with perturbation type 11 and severity 1..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_11_1_1_1" --perturb_type 11 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office0_11_1_1_1 done!"

echo "Running on office0 with perturbation type 12 and severity 1..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_12_1_1_1" --perturb_type 12 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office0_12_1_1_1 done!"

echo "Running on office0 with perturbation type 13 and severity 1..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_13_1_1_1" --perturb_type 13 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office0_13_1_1_1 done!"

echo "Running on office0 with perturbation type 14 and severity 1..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_14_1_1_1" --perturb_type 14 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office0_14_1_1_1 done!"

echo "Running on office0 with perturbation type 15 and severity 1..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_15_1_1_1" --perturb_type 15 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office0_15_1_1_1 done!"

echo "Running on office0 with perturbation type 16 and severity 1..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_16_1_1_1" --perturb_type 16 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office0_16_1_1_1 done!"

echo "Running on office0 with perturbation type 17 and severity 1..."
python run.py configs/Replica/office0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office0/office0_17_1_1_1" --perturb_type 17 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office0_17_1_1_1 done!"

echo "Running on office1 with perturbation type 0 and severity 5..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_0_5_1_1" --perturb_type 0 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office1_0_5_1_1 done!"

echo "Running on office1 with perturbation type 1 and severity 5..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_1_5_1_1" --perturb_type 1 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office1_1_5_1_1 done!"

echo "Running on office1 with perturbation type 2 and severity 5..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_2_5_1_1" --perturb_type 2 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office1_2_5_1_1 done!"

echo "Running on office1 with perturbation type 3 and severity 5..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_3_5_1_1" --perturb_type 3 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office1_3_5_1_1 done!"

echo "Running on office1 with perturbation type 4 and severity 5..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_4_5_1_1" --perturb_type 4 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office1_4_5_1_1 done!"

echo "Running on office1 with perturbation type 5 and severity 5..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_5_5_1_1" --perturb_type 5 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office1_5_5_1_1 done!"

echo "Running on office1 with perturbation type 6 and severity 5..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_6_5_1_1" --perturb_type 6 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office1_6_5_1_1 done!"

echo "Running on office1 with perturbation type 7 and severity 5..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_7_5_1_1" --perturb_type 7 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office1_7_5_1_1 done!"

echo "Running on office1 with perturbation type 8 and severity 5..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_8_5_1_1" --perturb_type 8 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office1_8_5_1_1 done!"

echo "Running on office1 with perturbation type 9 and severity 5..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_9_5_1_1" --perturb_type 9 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office1_9_5_1_1 done!"

echo "Running on office1 with perturbation type 10 and severity 5..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_10_5_1_1" --perturb_type 10 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office1_10_5_1_1 done!"

echo "Running on office1 with perturbation type 11 and severity 5..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_11_5_1_1" --perturb_type 11 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office1_11_5_1_1 done!"

echo "Running on office1 with perturbation type 12 and severity 5..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_12_5_1_1" --perturb_type 12 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office1_12_5_1_1 done!"

echo "Running on office1 with perturbation type 13 and severity 5..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_13_5_1_1" --perturb_type 13 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office1_13_5_1_1 done!"

echo "Running on office1 with perturbation type 14 and severity 5..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_14_5_1_1" --perturb_type 14 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office1_14_5_1_1 done!"

echo "Running on office1 with perturbation type 15 and severity 5..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_15_5_1_1" --perturb_type 15 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office1_15_5_1_1 done!"

echo "Running on office1 with perturbation type 16 and severity 5..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_16_5_1_1" --perturb_type 16 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office1_16_5_1_1 done!"

echo "Running on office1 with perturbation type 17 and severity 5..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_17_5_1_1" --perturb_type 17 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office1_17_5_1_1 done!"

echo "Running on office1 with perturbation type 0 and severity 3..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_0_3_1_1" --perturb_type 0 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office1_0_3_1_1 done!"

echo "Running on office1 with perturbation type 1 and severity 3..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_1_3_1_1" --perturb_type 1 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office1_1_3_1_1 done!"

echo "Running on office1 with perturbation type 2 and severity 3..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_2_3_1_1" --perturb_type 2 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office1_2_3_1_1 done!"

echo "Running on office1 with perturbation type 3 and severity 3..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_3_3_1_1" --perturb_type 3 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office1_3_3_1_1 done!"

echo "Running on office1 with perturbation type 4 and severity 3..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_4_3_1_1" --perturb_type 4 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office1_4_3_1_1 done!"

echo "Running on office1 with perturbation type 5 and severity 3..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_5_3_1_1" --perturb_type 5 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office1_5_3_1_1 done!"

echo "Running on office1 with perturbation type 6 and severity 3..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_6_3_1_1" --perturb_type 6 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office1_6_3_1_1 done!"

echo "Running on office1 with perturbation type 7 and severity 3..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_7_3_1_1" --perturb_type 7 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office1_7_3_1_1 done!"

echo "Running on office1 with perturbation type 8 and severity 3..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_8_3_1_1" --perturb_type 8 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office1_8_3_1_1 done!"

echo "Running on office1 with perturbation type 9 and severity 3..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_9_3_1_1" --perturb_type 9 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office1_9_3_1_1 done!"

echo "Running on office1 with perturbation type 10 and severity 3..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_10_3_1_1" --perturb_type 10 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office1_10_3_1_1 done!"

echo "Running on office1 with perturbation type 11 and severity 3..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_11_3_1_1" --perturb_type 11 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office1_11_3_1_1 done!"

echo "Running on office1 with perturbation type 12 and severity 3..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_12_3_1_1" --perturb_type 12 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office1_12_3_1_1 done!"

echo "Running on office1 with perturbation type 13 and severity 3..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_13_3_1_1" --perturb_type 13 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office1_13_3_1_1 done!"

echo "Running on office1 with perturbation type 14 and severity 3..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_14_3_1_1" --perturb_type 14 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office1_14_3_1_1 done!"

echo "Running on office1 with perturbation type 15 and severity 3..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_15_3_1_1" --perturb_type 15 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office1_15_3_1_1 done!"

echo "Running on office1 with perturbation type 16 and severity 3..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_16_3_1_1" --perturb_type 16 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office1_16_3_1_1 done!"

echo "Running on office1 with perturbation type 17 and severity 3..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_17_3_1_1" --perturb_type 17 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office1_17_3_1_1 done!"

echo "Running on office1 with perturbation type 0 and severity 1..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_0_1_1_1" --perturb_type 0 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office1_0_1_1_1 done!"

echo "Running on office1 with perturbation type 1 and severity 1..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_1_1_1_1" --perturb_type 1 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office1_1_1_1_1 done!"

echo "Running on office1 with perturbation type 2 and severity 1..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_2_1_1_1" --perturb_type 2 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office1_2_1_1_1 done!"

echo "Running on office1 with perturbation type 3 and severity 1..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_3_1_1_1" --perturb_type 3 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office1_3_1_1_1 done!"

echo "Running on office1 with perturbation type 4 and severity 1..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_4_1_1_1" --perturb_type 4 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office1_4_1_1_1 done!"

echo "Running on office1 with perturbation type 5 and severity 1..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_5_1_1_1" --perturb_type 5 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office1_5_1_1_1 done!"

echo "Running on office1 with perturbation type 6 and severity 1..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_6_1_1_1" --perturb_type 6 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office1_6_1_1_1 done!"

echo "Running on office1 with perturbation type 7 and severity 1..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_7_1_1_1" --perturb_type 7 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office1_7_1_1_1 done!"

echo "Running on office1 with perturbation type 8 and severity 1..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_8_1_1_1" --perturb_type 8 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office1_8_1_1_1 done!"

echo "Running on office1 with perturbation type 9 and severity 1..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_9_1_1_1" --perturb_type 9 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office1_9_1_1_1 done!"

echo "Running on office1 with perturbation type 10 and severity 1..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_10_1_1_1" --perturb_type 10 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office1_10_1_1_1 done!"

echo "Running on office1 with perturbation type 11 and severity 1..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_11_1_1_1" --perturb_type 11 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office1_11_1_1_1 done!"

echo "Running on office1 with perturbation type 12 and severity 1..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_12_1_1_1" --perturb_type 12 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office1_12_1_1_1 done!"

echo "Running on office1 with perturbation type 13 and severity 1..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_13_1_1_1" --perturb_type 13 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office1_13_1_1_1 done!"

echo "Running on office1 with perturbation type 14 and severity 1..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_14_1_1_1" --perturb_type 14 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office1_14_1_1_1 done!"

echo "Running on office1 with perturbation type 15 and severity 1..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_15_1_1_1" --perturb_type 15 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office1_15_1_1_1 done!"

echo "Running on office1 with perturbation type 16 and severity 1..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_16_1_1_1" --perturb_type 16 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office1_16_1_1_1 done!"

echo "Running on office1 with perturbation type 17 and severity 1..."
python run.py configs/Replica/office1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office1/office1_17_1_1_1" --perturb_type 17 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office1_17_1_1_1 done!"

echo "Running on office2 with perturbation type 0 and severity 5..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_0_5_1_1" --perturb_type 0 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office2_0_5_1_1 done!"

echo "Running on office2 with perturbation type 1 and severity 5..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_1_5_1_1" --perturb_type 1 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office2_1_5_1_1 done!"

echo "Running on office2 with perturbation type 2 and severity 5..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_2_5_1_1" --perturb_type 2 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office2_2_5_1_1 done!"

echo "Running on office2 with perturbation type 3 and severity 5..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_3_5_1_1" --perturb_type 3 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office2_3_5_1_1 done!"

echo "Running on office2 with perturbation type 4 and severity 5..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_4_5_1_1" --perturb_type 4 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office2_4_5_1_1 done!"

echo "Running on office2 with perturbation type 5 and severity 5..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_5_5_1_1" --perturb_type 5 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office2_5_5_1_1 done!"

echo "Running on office2 with perturbation type 6 and severity 5..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_6_5_1_1" --perturb_type 6 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office2_6_5_1_1 done!"

echo "Running on office2 with perturbation type 7 and severity 5..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_7_5_1_1" --perturb_type 7 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office2_7_5_1_1 done!"

echo "Running on office2 with perturbation type 8 and severity 5..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_8_5_1_1" --perturb_type 8 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office2_8_5_1_1 done!"

echo "Running on office2 with perturbation type 9 and severity 5..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_9_5_1_1" --perturb_type 9 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office2_9_5_1_1 done!"

echo "Running on office2 with perturbation type 10 and severity 5..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_10_5_1_1" --perturb_type 10 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office2_10_5_1_1 done!"

echo "Running on office2 with perturbation type 11 and severity 5..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_11_5_1_1" --perturb_type 11 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office2_11_5_1_1 done!"

echo "Running on office2 with perturbation type 12 and severity 5..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_12_5_1_1" --perturb_type 12 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office2_12_5_1_1 done!"

echo "Running on office2 with perturbation type 13 and severity 5..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_13_5_1_1" --perturb_type 13 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office2_13_5_1_1 done!"

echo "Running on office2 with perturbation type 14 and severity 5..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_14_5_1_1" --perturb_type 14 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office2_14_5_1_1 done!"

echo "Running on office2 with perturbation type 15 and severity 5..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_15_5_1_1" --perturb_type 15 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office2_15_5_1_1 done!"

echo "Running on office2 with perturbation type 16 and severity 5..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_16_5_1_1" --perturb_type 16 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office2_16_5_1_1 done!"

echo "Running on office2 with perturbation type 17 and severity 5..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_17_5_1_1" --perturb_type 17 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office2_17_5_1_1 done!"

echo "Running on office2 with perturbation type 0 and severity 3..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_0_3_1_1" --perturb_type 0 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office2_0_3_1_1 done!"

echo "Running on office2 with perturbation type 1 and severity 3..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_1_3_1_1" --perturb_type 1 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office2_1_3_1_1 done!"

echo "Running on office2 with perturbation type 2 and severity 3..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_2_3_1_1" --perturb_type 2 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office2_2_3_1_1 done!"

echo "Running on office2 with perturbation type 3 and severity 3..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_3_3_1_1" --perturb_type 3 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office2_3_3_1_1 done!"

echo "Running on office2 with perturbation type 4 and severity 3..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_4_3_1_1" --perturb_type 4 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office2_4_3_1_1 done!"

echo "Running on office2 with perturbation type 5 and severity 3..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_5_3_1_1" --perturb_type 5 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office2_5_3_1_1 done!"

echo "Running on office2 with perturbation type 6 and severity 3..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_6_3_1_1" --perturb_type 6 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office2_6_3_1_1 done!"

echo "Running on office2 with perturbation type 7 and severity 3..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_7_3_1_1" --perturb_type 7 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office2_7_3_1_1 done!"

echo "Running on office2 with perturbation type 8 and severity 3..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_8_3_1_1" --perturb_type 8 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office2_8_3_1_1 done!"

echo "Running on office2 with perturbation type 9 and severity 3..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_9_3_1_1" --perturb_type 9 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office2_9_3_1_1 done!"

echo "Running on office2 with perturbation type 10 and severity 3..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_10_3_1_1" --perturb_type 10 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office2_10_3_1_1 done!"

echo "Running on office2 with perturbation type 11 and severity 3..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_11_3_1_1" --perturb_type 11 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office2_11_3_1_1 done!"

echo "Running on office2 with perturbation type 12 and severity 3..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_12_3_1_1" --perturb_type 12 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office2_12_3_1_1 done!"

echo "Running on office2 with perturbation type 13 and severity 3..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_13_3_1_1" --perturb_type 13 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office2_13_3_1_1 done!"

echo "Running on office2 with perturbation type 14 and severity 3..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_14_3_1_1" --perturb_type 14 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office2_14_3_1_1 done!"

echo "Running on office2 with perturbation type 15 and severity 3..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_15_3_1_1" --perturb_type 15 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office2_15_3_1_1 done!"

echo "Running on office2 with perturbation type 16 and severity 3..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_16_3_1_1" --perturb_type 16 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office2_16_3_1_1 done!"

echo "Running on office2 with perturbation type 17 and severity 3..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_17_3_1_1" --perturb_type 17 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office2_17_3_1_1 done!"

echo "Running on office2 with perturbation type 0 and severity 1..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_0_1_1_1" --perturb_type 0 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office2_0_1_1_1 done!"

echo "Running on office2 with perturbation type 1 and severity 1..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_1_1_1_1" --perturb_type 1 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office2_1_1_1_1 done!"

echo "Running on office2 with perturbation type 2 and severity 1..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_2_1_1_1" --perturb_type 2 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office2_2_1_1_1 done!"

echo "Running on office2 with perturbation type 3 and severity 1..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_3_1_1_1" --perturb_type 3 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office2_3_1_1_1 done!"

echo "Running on office2 with perturbation type 4 and severity 1..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_4_1_1_1" --perturb_type 4 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office2_4_1_1_1 done!"

echo "Running on office2 with perturbation type 5 and severity 1..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_5_1_1_1" --perturb_type 5 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office2_5_1_1_1 done!"

echo "Running on office2 with perturbation type 6 and severity 1..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_6_1_1_1" --perturb_type 6 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office2_6_1_1_1 done!"

echo "Running on office2 with perturbation type 7 and severity 1..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_7_1_1_1" --perturb_type 7 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office2_7_1_1_1 done!"

echo "Running on office2 with perturbation type 8 and severity 1..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_8_1_1_1" --perturb_type 8 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office2_8_1_1_1 done!"

echo "Running on office2 with perturbation type 9 and severity 1..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_9_1_1_1" --perturb_type 9 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office2_9_1_1_1 done!"

echo "Running on office2 with perturbation type 10 and severity 1..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_10_1_1_1" --perturb_type 10 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office2_10_1_1_1 done!"

echo "Running on office2 with perturbation type 11 and severity 1..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_11_1_1_1" --perturb_type 11 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office2_11_1_1_1 done!"

echo "Running on office2 with perturbation type 12 and severity 1..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_12_1_1_1" --perturb_type 12 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office2_12_1_1_1 done!"

echo "Running on office2 with perturbation type 13 and severity 1..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_13_1_1_1" --perturb_type 13 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office2_13_1_1_1 done!"

echo "Running on office2 with perturbation type 14 and severity 1..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_14_1_1_1" --perturb_type 14 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office2_14_1_1_1 done!"

echo "Running on office2 with perturbation type 15 and severity 1..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_15_1_1_1" --perturb_type 15 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office2_15_1_1_1 done!"

echo "Running on office2 with perturbation type 16 and severity 1..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_16_1_1_1" --perturb_type 16 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office2_16_1_1_1 done!"

echo "Running on office2 with perturbation type 17 and severity 1..."
python run.py configs/Replica/office2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office2/office2_17_1_1_1" --perturb_type 17 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office2_17_1_1_1 done!"

echo "Running on office3 with perturbation type 0 and severity 5..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_0_5_1_1" --perturb_type 0 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office3_0_5_1_1 done!"

echo "Running on office3 with perturbation type 1 and severity 5..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_1_5_1_1" --perturb_type 1 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office3_1_5_1_1 done!"

echo "Running on office3 with perturbation type 2 and severity 5..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_2_5_1_1" --perturb_type 2 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office3_2_5_1_1 done!"

echo "Running on office3 with perturbation type 3 and severity 5..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_3_5_1_1" --perturb_type 3 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office3_3_5_1_1 done!"

echo "Running on office3 with perturbation type 4 and severity 5..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_4_5_1_1" --perturb_type 4 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office3_4_5_1_1 done!"

echo "Running on office3 with perturbation type 5 and severity 5..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_5_5_1_1" --perturb_type 5 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office3_5_5_1_1 done!"

echo "Running on office3 with perturbation type 6 and severity 5..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_6_5_1_1" --perturb_type 6 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office3_6_5_1_1 done!"

echo "Running on office3 with perturbation type 7 and severity 5..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_7_5_1_1" --perturb_type 7 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office3_7_5_1_1 done!"

echo "Running on office3 with perturbation type 8 and severity 5..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_8_5_1_1" --perturb_type 8 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office3_8_5_1_1 done!"

echo "Running on office3 with perturbation type 9 and severity 5..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_9_5_1_1" --perturb_type 9 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office3_9_5_1_1 done!"

echo "Running on office3 with perturbation type 10 and severity 5..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_10_5_1_1" --perturb_type 10 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office3_10_5_1_1 done!"

echo "Running on office3 with perturbation type 11 and severity 5..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_11_5_1_1" --perturb_type 11 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office3_11_5_1_1 done!"

echo "Running on office3 with perturbation type 12 and severity 5..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_12_5_1_1" --perturb_type 12 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office3_12_5_1_1 done!"

echo "Running on office3 with perturbation type 13 and severity 5..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_13_5_1_1" --perturb_type 13 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office3_13_5_1_1 done!"

echo "Running on office3 with perturbation type 14 and severity 5..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_14_5_1_1" --perturb_type 14 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office3_14_5_1_1 done!"

echo "Running on office3 with perturbation type 15 and severity 5..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_15_5_1_1" --perturb_type 15 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office3_15_5_1_1 done!"

echo "Running on office3 with perturbation type 16 and severity 5..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_16_5_1_1" --perturb_type 16 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office3_16_5_1_1 done!"

echo "Running on office3 with perturbation type 17 and severity 5..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_17_5_1_1" --perturb_type 17 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office3_17_5_1_1 done!"

echo "Running on office3 with perturbation type 0 and severity 3..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_0_3_1_1" --perturb_type 0 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office3_0_3_1_1 done!"

echo "Running on office3 with perturbation type 1 and severity 3..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_1_3_1_1" --perturb_type 1 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office3_1_3_1_1 done!"

echo "Running on office3 with perturbation type 2 and severity 3..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_2_3_1_1" --perturb_type 2 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office3_2_3_1_1 done!"

echo "Running on office3 with perturbation type 3 and severity 3..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_3_3_1_1" --perturb_type 3 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office3_3_3_1_1 done!"

echo "Running on office3 with perturbation type 4 and severity 3..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_4_3_1_1" --perturb_type 4 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office3_4_3_1_1 done!"

echo "Running on office3 with perturbation type 5 and severity 3..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_5_3_1_1" --perturb_type 5 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office3_5_3_1_1 done!"

echo "Running on office3 with perturbation type 6 and severity 3..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_6_3_1_1" --perturb_type 6 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office3_6_3_1_1 done!"

echo "Running on office3 with perturbation type 7 and severity 3..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_7_3_1_1" --perturb_type 7 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office3_7_3_1_1 done!"

echo "Running on office3 with perturbation type 8 and severity 3..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_8_3_1_1" --perturb_type 8 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office3_8_3_1_1 done!"

echo "Running on office3 with perturbation type 9 and severity 3..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_9_3_1_1" --perturb_type 9 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office3_9_3_1_1 done!"

echo "Running on office3 with perturbation type 10 and severity 3..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_10_3_1_1" --perturb_type 10 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office3_10_3_1_1 done!"

echo "Running on office3 with perturbation type 11 and severity 3..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_11_3_1_1" --perturb_type 11 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office3_11_3_1_1 done!"

echo "Running on office3 with perturbation type 12 and severity 3..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_12_3_1_1" --perturb_type 12 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office3_12_3_1_1 done!"

echo "Running on office3 with perturbation type 13 and severity 3..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_13_3_1_1" --perturb_type 13 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office3_13_3_1_1 done!"

echo "Running on office3 with perturbation type 14 and severity 3..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_14_3_1_1" --perturb_type 14 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office3_14_3_1_1 done!"

echo "Running on office3 with perturbation type 15 and severity 3..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_15_3_1_1" --perturb_type 15 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office3_15_3_1_1 done!"

echo "Running on office3 with perturbation type 16 and severity 3..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_16_3_1_1" --perturb_type 16 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office3_16_3_1_1 done!"

echo "Running on office3 with perturbation type 17 and severity 3..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_17_3_1_1" --perturb_type 17 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office3_17_3_1_1 done!"

echo "Running on office3 with perturbation type 0 and severity 1..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_0_1_1_1" --perturb_type 0 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office3_0_1_1_1 done!"

echo "Running on office3 with perturbation type 1 and severity 1..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_1_1_1_1" --perturb_type 1 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office3_1_1_1_1 done!"

echo "Running on office3 with perturbation type 2 and severity 1..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_2_1_1_1" --perturb_type 2 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office3_2_1_1_1 done!"

echo "Running on office3 with perturbation type 3 and severity 1..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_3_1_1_1" --perturb_type 3 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office3_3_1_1_1 done!"

echo "Running on office3 with perturbation type 4 and severity 1..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_4_1_1_1" --perturb_type 4 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office3_4_1_1_1 done!"

echo "Running on office3 with perturbation type 5 and severity 1..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_5_1_1_1" --perturb_type 5 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office3_5_1_1_1 done!"

echo "Running on office3 with perturbation type 6 and severity 1..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_6_1_1_1" --perturb_type 6 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office3_6_1_1_1 done!"

echo "Running on office3 with perturbation type 7 and severity 1..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_7_1_1_1" --perturb_type 7 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office3_7_1_1_1 done!"

echo "Running on office3 with perturbation type 8 and severity 1..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_8_1_1_1" --perturb_type 8 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office3_8_1_1_1 done!"

echo "Running on office3 with perturbation type 9 and severity 1..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_9_1_1_1" --perturb_type 9 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office3_9_1_1_1 done!"

echo "Running on office3 with perturbation type 10 and severity 1..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_10_1_1_1" --perturb_type 10 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office3_10_1_1_1 done!"

echo "Running on office3 with perturbation type 11 and severity 1..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_11_1_1_1" --perturb_type 11 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office3_11_1_1_1 done!"

echo "Running on office3 with perturbation type 12 and severity 1..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_12_1_1_1" --perturb_type 12 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office3_12_1_1_1 done!"

echo "Running on office3 with perturbation type 13 and severity 1..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_13_1_1_1" --perturb_type 13 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office3_13_1_1_1 done!"

echo "Running on office3 with perturbation type 14 and severity 1..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_14_1_1_1" --perturb_type 14 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office3_14_1_1_1 done!"

echo "Running on office3 with perturbation type 15 and severity 1..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_15_1_1_1" --perturb_type 15 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office3_15_1_1_1 done!"

echo "Running on office3 with perturbation type 16 and severity 1..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_16_1_1_1" --perturb_type 16 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office3_16_1_1_1 done!"

echo "Running on office3 with perturbation type 17 and severity 1..."
python run.py configs/Replica/office3.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office3/office3_17_1_1_1" --perturb_type 17 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office3_17_1_1_1 done!"

echo "Running on office4 with perturbation type 0 and severity 5..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_0_5_1_1" --perturb_type 0 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office4_0_5_1_1 done!"

echo "Running on office4 with perturbation type 1 and severity 5..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_1_5_1_1" --perturb_type 1 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office4_1_5_1_1 done!"

echo "Running on office4 with perturbation type 2 and severity 5..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_2_5_1_1" --perturb_type 2 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office4_2_5_1_1 done!"

echo "Running on office4 with perturbation type 3 and severity 5..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_3_5_1_1" --perturb_type 3 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office4_3_5_1_1 done!"

echo "Running on office4 with perturbation type 4 and severity 5..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_4_5_1_1" --perturb_type 4 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office4_4_5_1_1 done!"

echo "Running on office4 with perturbation type 5 and severity 5..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_5_5_1_1" --perturb_type 5 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office4_5_5_1_1 done!"

echo "Running on office4 with perturbation type 6 and severity 5..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_6_5_1_1" --perturb_type 6 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office4_6_5_1_1 done!"

echo "Running on office4 with perturbation type 7 and severity 5..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_7_5_1_1" --perturb_type 7 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office4_7_5_1_1 done!"

echo "Running on office4 with perturbation type 8 and severity 5..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_8_5_1_1" --perturb_type 8 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office4_8_5_1_1 done!"

echo "Running on office4 with perturbation type 9 and severity 5..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_9_5_1_1" --perturb_type 9 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office4_9_5_1_1 done!"

echo "Running on office4 with perturbation type 10 and severity 5..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_10_5_1_1" --perturb_type 10 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office4_10_5_1_1 done!"

echo "Running on office4 with perturbation type 11 and severity 5..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_11_5_1_1" --perturb_type 11 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office4_11_5_1_1 done!"

echo "Running on office4 with perturbation type 12 and severity 5..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_12_5_1_1" --perturb_type 12 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office4_12_5_1_1 done!"

echo "Running on office4 with perturbation type 13 and severity 5..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_13_5_1_1" --perturb_type 13 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office4_13_5_1_1 done!"

echo "Running on office4 with perturbation type 14 and severity 5..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_14_5_1_1" --perturb_type 14 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office4_14_5_1_1 done!"

echo "Running on office4 with perturbation type 15 and severity 5..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_15_5_1_1" --perturb_type 15 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office4_15_5_1_1 done!"

echo "Running on office4 with perturbation type 16 and severity 5..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_16_5_1_1" --perturb_type 16 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office4_16_5_1_1 done!"

echo "Running on office4 with perturbation type 17 and severity 5..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_17_5_1_1" --perturb_type 17 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "office4_17_5_1_1 done!"

echo "Running on office4 with perturbation type 0 and severity 3..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_0_3_1_1" --perturb_type 0 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office4_0_3_1_1 done!"

echo "Running on office4 with perturbation type 1 and severity 3..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_1_3_1_1" --perturb_type 1 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office4_1_3_1_1 done!"

echo "Running on office4 with perturbation type 2 and severity 3..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_2_3_1_1" --perturb_type 2 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office4_2_3_1_1 done!"

echo "Running on office4 with perturbation type 3 and severity 3..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_3_3_1_1" --perturb_type 3 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office4_3_3_1_1 done!"

echo "Running on office4 with perturbation type 4 and severity 3..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_4_3_1_1" --perturb_type 4 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office4_4_3_1_1 done!"

echo "Running on office4 with perturbation type 5 and severity 3..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_5_3_1_1" --perturb_type 5 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office4_5_3_1_1 done!"

echo "Running on office4 with perturbation type 6 and severity 3..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_6_3_1_1" --perturb_type 6 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office4_6_3_1_1 done!"

echo "Running on office4 with perturbation type 7 and severity 3..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_7_3_1_1" --perturb_type 7 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office4_7_3_1_1 done!"

echo "Running on office4 with perturbation type 8 and severity 3..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_8_3_1_1" --perturb_type 8 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office4_8_3_1_1 done!"

echo "Running on office4 with perturbation type 9 and severity 3..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_9_3_1_1" --perturb_type 9 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office4_9_3_1_1 done!"

echo "Running on office4 with perturbation type 10 and severity 3..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_10_3_1_1" --perturb_type 10 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office4_10_3_1_1 done!"

echo "Running on office4 with perturbation type 11 and severity 3..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_11_3_1_1" --perturb_type 11 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office4_11_3_1_1 done!"

echo "Running on office4 with perturbation type 12 and severity 3..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_12_3_1_1" --perturb_type 12 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office4_12_3_1_1 done!"

echo "Running on office4 with perturbation type 13 and severity 3..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_13_3_1_1" --perturb_type 13 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office4_13_3_1_1 done!"

echo "Running on office4 with perturbation type 14 and severity 3..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_14_3_1_1" --perturb_type 14 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office4_14_3_1_1 done!"

echo "Running on office4 with perturbation type 15 and severity 3..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_15_3_1_1" --perturb_type 15 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office4_15_3_1_1 done!"

echo "Running on office4 with perturbation type 16 and severity 3..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_16_3_1_1" --perturb_type 16 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office4_16_3_1_1 done!"

echo "Running on office4 with perturbation type 17 and severity 3..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_17_3_1_1" --perturb_type 17 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "office4_17_3_1_1 done!"

echo "Running on office4 with perturbation type 0 and severity 1..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_0_1_1_1" --perturb_type 0 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office4_0_1_1_1 done!"

echo "Running on office4 with perturbation type 1 and severity 1..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_1_1_1_1" --perturb_type 1 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office4_1_1_1_1 done!"

echo "Running on office4 with perturbation type 2 and severity 1..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_2_1_1_1" --perturb_type 2 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office4_2_1_1_1 done!"

echo "Running on office4 with perturbation type 3 and severity 1..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_3_1_1_1" --perturb_type 3 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office4_3_1_1_1 done!"

echo "Running on office4 with perturbation type 4 and severity 1..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_4_1_1_1" --perturb_type 4 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office4_4_1_1_1 done!"

echo "Running on office4 with perturbation type 5 and severity 1..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_5_1_1_1" --perturb_type 5 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office4_5_1_1_1 done!"

echo "Running on office4 with perturbation type 6 and severity 1..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_6_1_1_1" --perturb_type 6 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office4_6_1_1_1 done!"

echo "Running on office4 with perturbation type 7 and severity 1..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_7_1_1_1" --perturb_type 7 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office4_7_1_1_1 done!"

echo "Running on office4 with perturbation type 8 and severity 1..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_8_1_1_1" --perturb_type 8 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office4_8_1_1_1 done!"

echo "Running on office4 with perturbation type 9 and severity 1..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_9_1_1_1" --perturb_type 9 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office4_9_1_1_1 done!"

echo "Running on office4 with perturbation type 10 and severity 1..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_10_1_1_1" --perturb_type 10 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office4_10_1_1_1 done!"

echo "Running on office4 with perturbation type 11 and severity 1..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_11_1_1_1" --perturb_type 11 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office4_11_1_1_1 done!"

echo "Running on office4 with perturbation type 12 and severity 1..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_12_1_1_1" --perturb_type 12 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office4_12_1_1_1 done!"

echo "Running on office4 with perturbation type 13 and severity 1..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_13_1_1_1" --perturb_type 13 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office4_13_1_1_1 done!"

echo "Running on office4 with perturbation type 14 and severity 1..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_14_1_1_1" --perturb_type 14 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office4_14_1_1_1 done!"

echo "Running on office4 with perturbation type 15 and severity 1..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_15_1_1_1" --perturb_type 15 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office4_15_1_1_1 done!"

echo "Running on office4 with perturbation type 16 and severity 1..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_16_1_1_1" --perturb_type 16 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office4_16_1_1_1 done!"

echo "Running on office4 with perturbation type 17 and severity 1..."
python run.py configs/Replica/office4.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/office4/office4_17_1_1_1" --perturb_type 17 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "office4_17_1_1_1 done!"

echo "Running on room0 with perturbation type 0 and severity 5..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_0_5_1_1" --perturb_type 0 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room0_0_5_1_1 done!"

echo "Running on room0 with perturbation type 1 and severity 5..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_1_5_1_1" --perturb_type 1 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room0_1_5_1_1 done!"

echo "Running on room0 with perturbation type 2 and severity 5..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_2_5_1_1" --perturb_type 2 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room0_2_5_1_1 done!"

echo "Running on room0 with perturbation type 3 and severity 5..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_3_5_1_1" --perturb_type 3 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room0_3_5_1_1 done!"

echo "Running on room0 with perturbation type 4 and severity 5..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_4_5_1_1" --perturb_type 4 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room0_4_5_1_1 done!"

echo "Running on room0 with perturbation type 5 and severity 5..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_5_5_1_1" --perturb_type 5 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room0_5_5_1_1 done!"

echo "Running on room0 with perturbation type 6 and severity 5..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_6_5_1_1" --perturb_type 6 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room0_6_5_1_1 done!"

echo "Running on room0 with perturbation type 7 and severity 5..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_7_5_1_1" --perturb_type 7 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room0_7_5_1_1 done!"

echo "Running on room0 with perturbation type 8 and severity 5..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_8_5_1_1" --perturb_type 8 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room0_8_5_1_1 done!"

echo "Running on room0 with perturbation type 9 and severity 5..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_9_5_1_1" --perturb_type 9 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room0_9_5_1_1 done!"

echo "Running on room0 with perturbation type 10 and severity 5..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_10_5_1_1" --perturb_type 10 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room0_10_5_1_1 done!"

echo "Running on room0 with perturbation type 11 and severity 5..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_11_5_1_1" --perturb_type 11 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room0_11_5_1_1 done!"

echo "Running on room0 with perturbation type 12 and severity 5..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_12_5_1_1" --perturb_type 12 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room0_12_5_1_1 done!"

echo "Running on room0 with perturbation type 13 and severity 5..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_13_5_1_1" --perturb_type 13 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room0_13_5_1_1 done!"

echo "Running on room0 with perturbation type 14 and severity 5..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_14_5_1_1" --perturb_type 14 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room0_14_5_1_1 done!"

echo "Running on room0 with perturbation type 15 and severity 5..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_15_5_1_1" --perturb_type 15 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room0_15_5_1_1 done!"

echo "Running on room0 with perturbation type 16 and severity 5..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_16_5_1_1" --perturb_type 16 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room0_16_5_1_1 done!"

echo "Running on room0 with perturbation type 17 and severity 5..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_17_5_1_1" --perturb_type 17 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room0_17_5_1_1 done!"

echo "Running on room0 with perturbation type 0 and severity 3..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_0_3_1_1" --perturb_type 0 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room0_0_3_1_1 done!"

echo "Running on room0 with perturbation type 1 and severity 3..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_1_3_1_1" --perturb_type 1 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room0_1_3_1_1 done!"

echo "Running on room0 with perturbation type 2 and severity 3..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_2_3_1_1" --perturb_type 2 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room0_2_3_1_1 done!"

echo "Running on room0 with perturbation type 3 and severity 3..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_3_3_1_1" --perturb_type 3 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room0_3_3_1_1 done!"

echo "Running on room0 with perturbation type 4 and severity 3..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_4_3_1_1" --perturb_type 4 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room0_4_3_1_1 done!"

echo "Running on room0 with perturbation type 5 and severity 3..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_5_3_1_1" --perturb_type 5 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room0_5_3_1_1 done!"

echo "Running on room0 with perturbation type 6 and severity 3..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_6_3_1_1" --perturb_type 6 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room0_6_3_1_1 done!"

echo "Running on room0 with perturbation type 7 and severity 3..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_7_3_1_1" --perturb_type 7 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room0_7_3_1_1 done!"

echo "Running on room0 with perturbation type 8 and severity 3..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_8_3_1_1" --perturb_type 8 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room0_8_3_1_1 done!"

echo "Running on room0 with perturbation type 9 and severity 3..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_9_3_1_1" --perturb_type 9 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room0_9_3_1_1 done!"

echo "Running on room0 with perturbation type 10 and severity 3..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_10_3_1_1" --perturb_type 10 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room0_10_3_1_1 done!"

echo "Running on room0 with perturbation type 11 and severity 3..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_11_3_1_1" --perturb_type 11 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room0_11_3_1_1 done!"

echo "Running on room0 with perturbation type 12 and severity 3..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_12_3_1_1" --perturb_type 12 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room0_12_3_1_1 done!"

echo "Running on room0 with perturbation type 13 and severity 3..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_13_3_1_1" --perturb_type 13 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room0_13_3_1_1 done!"

echo "Running on room0 with perturbation type 14 and severity 3..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_14_3_1_1" --perturb_type 14 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room0_14_3_1_1 done!"

echo "Running on room0 with perturbation type 15 and severity 3..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_15_3_1_1" --perturb_type 15 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room0_15_3_1_1 done!"

echo "Running on room0 with perturbation type 16 and severity 3..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_16_3_1_1" --perturb_type 16 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room0_16_3_1_1 done!"

echo "Running on room0 with perturbation type 17 and severity 3..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_17_3_1_1" --perturb_type 17 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room0_17_3_1_1 done!"

echo "Running on room0 with perturbation type 0 and severity 1..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_0_1_1_1" --perturb_type 0 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room0_0_1_1_1 done!"

echo "Running on room0 with perturbation type 1 and severity 1..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_1_1_1_1" --perturb_type 1 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room0_1_1_1_1 done!"

echo "Running on room0 with perturbation type 2 and severity 1..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_2_1_1_1" --perturb_type 2 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room0_2_1_1_1 done!"

echo "Running on room0 with perturbation type 3 and severity 1..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_3_1_1_1" --perturb_type 3 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room0_3_1_1_1 done!"

echo "Running on room0 with perturbation type 4 and severity 1..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_4_1_1_1" --perturb_type 4 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room0_4_1_1_1 done!"

echo "Running on room0 with perturbation type 5 and severity 1..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_5_1_1_1" --perturb_type 5 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room0_5_1_1_1 done!"

echo "Running on room0 with perturbation type 6 and severity 1..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_6_1_1_1" --perturb_type 6 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room0_6_1_1_1 done!"

echo "Running on room0 with perturbation type 7 and severity 1..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_7_1_1_1" --perturb_type 7 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room0_7_1_1_1 done!"

echo "Running on room0 with perturbation type 8 and severity 1..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_8_1_1_1" --perturb_type 8 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room0_8_1_1_1 done!"

echo "Running on room0 with perturbation type 9 and severity 1..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_9_1_1_1" --perturb_type 9 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room0_9_1_1_1 done!"

echo "Running on room0 with perturbation type 10 and severity 1..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_10_1_1_1" --perturb_type 10 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room0_10_1_1_1 done!"

echo "Running on room0 with perturbation type 11 and severity 1..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_11_1_1_1" --perturb_type 11 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room0_11_1_1_1 done!"

echo "Running on room0 with perturbation type 12 and severity 1..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_12_1_1_1" --perturb_type 12 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room0_12_1_1_1 done!"

echo "Running on room0 with perturbation type 13 and severity 1..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_13_1_1_1" --perturb_type 13 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room0_13_1_1_1 done!"

echo "Running on room0 with perturbation type 14 and severity 1..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_14_1_1_1" --perturb_type 14 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room0_14_1_1_1 done!"

echo "Running on room0 with perturbation type 15 and severity 1..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_15_1_1_1" --perturb_type 15 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room0_15_1_1_1 done!"

echo "Running on room0 with perturbation type 16 and severity 1..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_16_1_1_1" --perturb_type 16 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room0_16_1_1_1 done!"

echo "Running on room0 with perturbation type 17 and severity 1..."
python run.py configs/Replica/room0.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room0/room0_17_1_1_1" --perturb_type 17 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room0_17_1_1_1 done!"

echo "Running on room1 with perturbation type 0 and severity 5..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_0_5_1_1" --perturb_type 0 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room1_0_5_1_1 done!"

echo "Running on room1 with perturbation type 1 and severity 5..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_1_5_1_1" --perturb_type 1 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room1_1_5_1_1 done!"

echo "Running on room1 with perturbation type 2 and severity 5..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_2_5_1_1" --perturb_type 2 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room1_2_5_1_1 done!"

echo "Running on room1 with perturbation type 3 and severity 5..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_3_5_1_1" --perturb_type 3 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room1_3_5_1_1 done!"

echo "Running on room1 with perturbation type 4 and severity 5..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_4_5_1_1" --perturb_type 4 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room1_4_5_1_1 done!"

echo "Running on room1 with perturbation type 5 and severity 5..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_5_5_1_1" --perturb_type 5 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room1_5_5_1_1 done!"

echo "Running on room1 with perturbation type 6 and severity 5..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_6_5_1_1" --perturb_type 6 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room1_6_5_1_1 done!"

echo "Running on room1 with perturbation type 7 and severity 5..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_7_5_1_1" --perturb_type 7 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room1_7_5_1_1 done!"

echo "Running on room1 with perturbation type 8 and severity 5..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_8_5_1_1" --perturb_type 8 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room1_8_5_1_1 done!"

echo "Running on room1 with perturbation type 9 and severity 5..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_9_5_1_1" --perturb_type 9 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room1_9_5_1_1 done!"

echo "Running on room1 with perturbation type 10 and severity 5..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_10_5_1_1" --perturb_type 10 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room1_10_5_1_1 done!"

echo "Running on room1 with perturbation type 11 and severity 5..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_11_5_1_1" --perturb_type 11 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room1_11_5_1_1 done!"

echo "Running on room1 with perturbation type 12 and severity 5..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_12_5_1_1" --perturb_type 12 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room1_12_5_1_1 done!"

echo "Running on room1 with perturbation type 13 and severity 5..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_13_5_1_1" --perturb_type 13 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room1_13_5_1_1 done!"

echo "Running on room1 with perturbation type 14 and severity 5..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_14_5_1_1" --perturb_type 14 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room1_14_5_1_1 done!"

echo "Running on room1 with perturbation type 15 and severity 5..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_15_5_1_1" --perturb_type 15 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room1_15_5_1_1 done!"

echo "Running on room1 with perturbation type 16 and severity 5..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_16_5_1_1" --perturb_type 16 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room1_16_5_1_1 done!"

echo "Running on room1 with perturbation type 17 and severity 5..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_17_5_1_1" --perturb_type 17 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room1_17_5_1_1 done!"

echo "Running on room1 with perturbation type 0 and severity 3..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_0_3_1_1" --perturb_type 0 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room1_0_3_1_1 done!"

echo "Running on room1 with perturbation type 1 and severity 3..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_1_3_1_1" --perturb_type 1 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room1_1_3_1_1 done!"

echo "Running on room1 with perturbation type 2 and severity 3..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_2_3_1_1" --perturb_type 2 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room1_2_3_1_1 done!"

echo "Running on room1 with perturbation type 3 and severity 3..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_3_3_1_1" --perturb_type 3 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room1_3_3_1_1 done!"

echo "Running on room1 with perturbation type 4 and severity 3..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_4_3_1_1" --perturb_type 4 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room1_4_3_1_1 done!"

echo "Running on room1 with perturbation type 5 and severity 3..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_5_3_1_1" --perturb_type 5 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room1_5_3_1_1 done!"

echo "Running on room1 with perturbation type 6 and severity 3..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_6_3_1_1" --perturb_type 6 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room1_6_3_1_1 done!"

echo "Running on room1 with perturbation type 7 and severity 3..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_7_3_1_1" --perturb_type 7 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room1_7_3_1_1 done!"

echo "Running on room1 with perturbation type 8 and severity 3..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_8_3_1_1" --perturb_type 8 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room1_8_3_1_1 done!"

echo "Running on room1 with perturbation type 9 and severity 3..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_9_3_1_1" --perturb_type 9 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room1_9_3_1_1 done!"

echo "Running on room1 with perturbation type 10 and severity 3..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_10_3_1_1" --perturb_type 10 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room1_10_3_1_1 done!"

echo "Running on room1 with perturbation type 11 and severity 3..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_11_3_1_1" --perturb_type 11 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room1_11_3_1_1 done!"

echo "Running on room1 with perturbation type 12 and severity 3..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_12_3_1_1" --perturb_type 12 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room1_12_3_1_1 done!"

echo "Running on room1 with perturbation type 13 and severity 3..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_13_3_1_1" --perturb_type 13 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room1_13_3_1_1 done!"

echo "Running on room1 with perturbation type 14 and severity 3..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_14_3_1_1" --perturb_type 14 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room1_14_3_1_1 done!"

echo "Running on room1 with perturbation type 15 and severity 3..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_15_3_1_1" --perturb_type 15 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room1_15_3_1_1 done!"

echo "Running on room1 with perturbation type 16 and severity 3..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_16_3_1_1" --perturb_type 16 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room1_16_3_1_1 done!"

echo "Running on room1 with perturbation type 17 and severity 3..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_17_3_1_1" --perturb_type 17 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room1_17_3_1_1 done!"

echo "Running on room1 with perturbation type 0 and severity 1..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_0_1_1_1" --perturb_type 0 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room1_0_1_1_1 done!"

echo "Running on room1 with perturbation type 1 and severity 1..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_1_1_1_1" --perturb_type 1 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room1_1_1_1_1 done!"

echo "Running on room1 with perturbation type 2 and severity 1..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_2_1_1_1" --perturb_type 2 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room1_2_1_1_1 done!"

echo "Running on room1 with perturbation type 3 and severity 1..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_3_1_1_1" --perturb_type 3 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room1_3_1_1_1 done!"

echo "Running on room1 with perturbation type 4 and severity 1..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_4_1_1_1" --perturb_type 4 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room1_4_1_1_1 done!"

echo "Running on room1 with perturbation type 5 and severity 1..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_5_1_1_1" --perturb_type 5 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room1_5_1_1_1 done!"

echo "Running on room1 with perturbation type 6 and severity 1..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_6_1_1_1" --perturb_type 6 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room1_6_1_1_1 done!"

echo "Running on room1 with perturbation type 7 and severity 1..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_7_1_1_1" --perturb_type 7 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room1_7_1_1_1 done!"

echo "Running on room1 with perturbation type 8 and severity 1..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_8_1_1_1" --perturb_type 8 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room1_8_1_1_1 done!"

echo "Running on room1 with perturbation type 9 and severity 1..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_9_1_1_1" --perturb_type 9 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room1_9_1_1_1 done!"

echo "Running on room1 with perturbation type 10 and severity 1..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_10_1_1_1" --perturb_type 10 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room1_10_1_1_1 done!"

echo "Running on room1 with perturbation type 11 and severity 1..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_11_1_1_1" --perturb_type 11 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room1_11_1_1_1 done!"

echo "Running on room1 with perturbation type 12 and severity 1..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_12_1_1_1" --perturb_type 12 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room1_12_1_1_1 done!"

echo "Running on room1 with perturbation type 13 and severity 1..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_13_1_1_1" --perturb_type 13 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room1_13_1_1_1 done!"

echo "Running on room1 with perturbation type 14 and severity 1..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_14_1_1_1" --perturb_type 14 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room1_14_1_1_1 done!"

echo "Running on room1 with perturbation type 15 and severity 1..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_15_1_1_1" --perturb_type 15 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room1_15_1_1_1 done!"

echo "Running on room1 with perturbation type 16 and severity 1..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_16_1_1_1" --perturb_type 16 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room1_16_1_1_1 done!"

echo "Running on room1 with perturbation type 17 and severity 1..."
python run.py configs/Replica/room1.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room1/room1_17_1_1_1" --perturb_type 17 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room1_17_1_1_1 done!"

echo "Running on room2 with perturbation type 0 and severity 5..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_0_5_1_1" --perturb_type 0 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room2_0_5_1_1 done!"

echo "Running on room2 with perturbation type 1 and severity 5..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_1_5_1_1" --perturb_type 1 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room2_1_5_1_1 done!"

echo "Running on room2 with perturbation type 2 and severity 5..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_2_5_1_1" --perturb_type 2 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room2_2_5_1_1 done!"

echo "Running on room2 with perturbation type 3 and severity 5..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_3_5_1_1" --perturb_type 3 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room2_3_5_1_1 done!"

echo "Running on room2 with perturbation type 4 and severity 5..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_4_5_1_1" --perturb_type 4 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room2_4_5_1_1 done!"

echo "Running on room2 with perturbation type 5 and severity 5..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_5_5_1_1" --perturb_type 5 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room2_5_5_1_1 done!"

echo "Running on room2 with perturbation type 6 and severity 5..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_6_5_1_1" --perturb_type 6 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room2_6_5_1_1 done!"

echo "Running on room2 with perturbation type 7 and severity 5..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_7_5_1_1" --perturb_type 7 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room2_7_5_1_1 done!"

echo "Running on room2 with perturbation type 8 and severity 5..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_8_5_1_1" --perturb_type 8 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room2_8_5_1_1 done!"

echo "Running on room2 with perturbation type 9 and severity 5..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_9_5_1_1" --perturb_type 9 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room2_9_5_1_1 done!"

echo "Running on room2 with perturbation type 10 and severity 5..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_10_5_1_1" --perturb_type 10 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room2_10_5_1_1 done!"

echo "Running on room2 with perturbation type 11 and severity 5..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_11_5_1_1" --perturb_type 11 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room2_11_5_1_1 done!"

echo "Running on room2 with perturbation type 12 and severity 5..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_12_5_1_1" --perturb_type 12 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room2_12_5_1_1 done!"

echo "Running on room2 with perturbation type 13 and severity 5..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_13_5_1_1" --perturb_type 13 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room2_13_5_1_1 done!"

echo "Running on room2 with perturbation type 14 and severity 5..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_14_5_1_1" --perturb_type 14 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room2_14_5_1_1 done!"

echo "Running on room2 with perturbation type 15 and severity 5..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_15_5_1_1" --perturb_type 15 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room2_15_5_1_1 done!"

echo "Running on room2 with perturbation type 16 and severity 5..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_16_5_1_1" --perturb_type 16 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room2_16_5_1_1 done!"

echo "Running on room2 with perturbation type 17 and severity 5..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_17_5_1_1" --perturb_type 17 --perturb_severity 5 --frame_downsample 1 --perturb_dynamic 1
echo "room2_17_5_1_1 done!"

echo "Running on room2 with perturbation type 0 and severity 3..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_0_3_1_1" --perturb_type 0 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room2_0_3_1_1 done!"

echo "Running on room2 with perturbation type 1 and severity 3..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_1_3_1_1" --perturb_type 1 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room2_1_3_1_1 done!"

echo "Running on room2 with perturbation type 2 and severity 3..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_2_3_1_1" --perturb_type 2 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room2_2_3_1_1 done!"

echo "Running on room2 with perturbation type 3 and severity 3..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_3_3_1_1" --perturb_type 3 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room2_3_3_1_1 done!"

echo "Running on room2 with perturbation type 4 and severity 3..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_4_3_1_1" --perturb_type 4 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room2_4_3_1_1 done!"

echo "Running on room2 with perturbation type 5 and severity 3..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_5_3_1_1" --perturb_type 5 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room2_5_3_1_1 done!"

echo "Running on room2 with perturbation type 6 and severity 3..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_6_3_1_1" --perturb_type 6 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room2_6_3_1_1 done!"

echo "Running on room2 with perturbation type 7 and severity 3..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_7_3_1_1" --perturb_type 7 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room2_7_3_1_1 done!"

echo "Running on room2 with perturbation type 8 and severity 3..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_8_3_1_1" --perturb_type 8 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room2_8_3_1_1 done!"

echo "Running on room2 with perturbation type 9 and severity 3..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_9_3_1_1" --perturb_type 9 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room2_9_3_1_1 done!"

echo "Running on room2 with perturbation type 10 and severity 3..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_10_3_1_1" --perturb_type 10 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room2_10_3_1_1 done!"

echo "Running on room2 with perturbation type 11 and severity 3..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_11_3_1_1" --perturb_type 11 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room2_11_3_1_1 done!"

echo "Running on room2 with perturbation type 12 and severity 3..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_12_3_1_1" --perturb_type 12 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room2_12_3_1_1 done!"

echo "Running on room2 with perturbation type 13 and severity 3..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_13_3_1_1" --perturb_type 13 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room2_13_3_1_1 done!"

echo "Running on room2 with perturbation type 14 and severity 3..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_14_3_1_1" --perturb_type 14 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room2_14_3_1_1 done!"

echo "Running on room2 with perturbation type 15 and severity 3..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_15_3_1_1" --perturb_type 15 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room2_15_3_1_1 done!"

echo "Running on room2 with perturbation type 16 and severity 3..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_16_3_1_1" --perturb_type 16 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room2_16_3_1_1 done!"

echo "Running on room2 with perturbation type 17 and severity 3..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_17_3_1_1" --perturb_type 17 --perturb_severity 3 --frame_downsample 1 --perturb_dynamic 1
echo "room2_17_3_1_1 done!"

echo "Running on room2 with perturbation type 0 and severity 1..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_0_1_1_1" --perturb_type 0 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room2_0_1_1_1 done!"

echo "Running on room2 with perturbation type 1 and severity 1..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_1_1_1_1" --perturb_type 1 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room2_1_1_1_1 done!"

echo "Running on room2 with perturbation type 2 and severity 1..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_2_1_1_1" --perturb_type 2 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room2_2_1_1_1 done!"

echo "Running on room2 with perturbation type 3 and severity 1..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_3_1_1_1" --perturb_type 3 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room2_3_1_1_1 done!"

echo "Running on room2 with perturbation type 4 and severity 1..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_4_1_1_1" --perturb_type 4 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room2_4_1_1_1 done!"

echo "Running on room2 with perturbation type 5 and severity 1..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_5_1_1_1" --perturb_type 5 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room2_5_1_1_1 done!"

echo "Running on room2 with perturbation type 6 and severity 1..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_6_1_1_1" --perturb_type 6 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room2_6_1_1_1 done!"

echo "Running on room2 with perturbation type 7 and severity 1..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_7_1_1_1" --perturb_type 7 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room2_7_1_1_1 done!"

echo "Running on room2 with perturbation type 8 and severity 1..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_8_1_1_1" --perturb_type 8 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room2_8_1_1_1 done!"

echo "Running on room2 with perturbation type 9 and severity 1..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_9_1_1_1" --perturb_type 9 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room2_9_1_1_1 done!"

echo "Running on room2 with perturbation type 10 and severity 1..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_10_1_1_1" --perturb_type 10 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room2_10_1_1_1 done!"

echo "Running on room2 with perturbation type 11 and severity 1..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_11_1_1_1" --perturb_type 11 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room2_11_1_1_1 done!"

echo "Running on room2 with perturbation type 12 and severity 1..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_12_1_1_1" --perturb_type 12 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room2_12_1_1_1 done!"

echo "Running on room2 with perturbation type 13 and severity 1..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_13_1_1_1" --perturb_type 13 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room2_13_1_1_1 done!"

echo "Running on room2 with perturbation type 14 and severity 1..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_14_1_1_1" --perturb_type 14 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room2_14_1_1_1 done!"

echo "Running on room2 with perturbation type 15 and severity 1..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_15_1_1_1" --perturb_type 15 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room2_15_1_1_1 done!"

echo "Running on room2 with perturbation type 16 and severity 1..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_16_1_1_1" --perturb_type 16 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room2_16_1_1_1 done!"

echo "Running on room2 with perturbation type 17 and severity 1..."
python run.py configs/Replica/room2.yaml --device cuda:0 --mode rgbd --output "${OUT_DIR}/room2/room2_17_1_1_1" --perturb_type 17 --perturb_severity 1 --frame_downsample 1 --perturb_dynamic 1
echo "room2_17_1_1_1 done!"

echo "Evaluation complete."
