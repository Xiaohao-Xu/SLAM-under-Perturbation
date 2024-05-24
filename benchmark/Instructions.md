# Benchmarking SLAM Robustness under Perturbations

## General Notice and Instructions
- Modify the input/output/dataset paths in the provided shell scripts to match your system's configuration.
- Detailed instructions and scripts are provided in the subsequent sections.
- Note that the scripts are given as relative paths within the separate folder of each baseline model.
- Set up the environments according to each baseline model. To facilitate easier reproduction, we have provided some packaged-environments for certain methods.
- We leverage Replica dataset as the **clean** source dataset and transform it to **perturbed** noisy data for robustness benchmarking. If you would like to use other datasets as the source dataset, please refer to the dataloader part of the code for reference. 


## iMAP under Perturbation
The following are instructions for experiments on iMAP.

### Exp 0: Preparation & Clean Setting Reproduction 
- 1: Set up the environment and Replica dataset according to the Readme file under the ''nice-slam'' folder
- 2: Run the standard evalution on Replica according to the Readme file under the ''nice-slam'' folder (The scripts are under ''./nice-slam/scipts/'' folder, please remember to check the dataset path and change the output path to be outside of this folder)

### Exp 1: RGB Imaging Perturbation (Static Mode) 
- ``` shell
  bash ./scripts/run_replica_imap_img_perturb_all_new.sh
  ```

### Exp 2: RGB Imaging Perturbation (Dynamic Mode) 
- ``` shell
  bash ./scripts/run_replica_imap_img_perturb_all_new_d.sh
  ```

### Exp 3: Depth Imaging Perturbation 
- ``` shell
  bash ./scripts/run_replica_imap_depth_perturb_all.sh
  ```
  
### Exp 4: Faster Motion Effect Perturbation
- ``` shell
  bash ./scripts/run_replica_imap_motion_perturb_new.sh
  ```

### Exp 5: Motion Deviation Perturbation 
- Download the rendered dataset with motion devitaions from [DropBox](https://www.dropbox.com/scl/fi/n52t2k3kdmxs7awdfk7js/Replica-Dataset-With-Motion-Deviations.zip?rlkey=dsvjlvcx3y2v0jf0c51d5sldk&dl=0). It is nearly 200GB. So please keep patient.
- Then, please set up the folder path in the script before running it.
- ``` shell
  bash ./scripts/replica_imap_nested_to_traj_perturb_new.sh
  ```

### Exp 6: Sensor De-synchronization Perturbation
- ``` shell
  bash ./scripts/run_replica_imap_misalign_perturb.sh
  ```


## Nice-SLAM under Perturbation
The following are instructions for experiments on Nice-SLAM.

### Exp 0: Preparation & Clean Setting Reproduction 
- 1: Set up the environment and Replica dataset according to the Readme file under the ''nice-slam'' folder
- 2: Run the standard evalution on Replica according to the Readme file under the ''nice-slam'' folder (The scripts are under ''./nice-slam/scipts/'' folder, please remember to check the dataset path and change the output path to be outside of this folder)

### Exp 1: RGB Imaging Perturbation (Static Mode) 
- ``` shell
  bash ./scripts/run_replica_niceslam_img_perturb_all.sh
  ```

### Exp 2: RGB Imaging Perturbation (Dynamic Mode) 
- ``` shell
  bash ./scripts/run_replica_niceslam_img_perturb_all_d.sh
  ```

### Exp 3: Depth Imaging Perturbation 
- ``` shell
  bash ./scripts/run_replica_niceslam_depth_perturb_all.sh
  ```

### Exp 4: Faster Motion Effect Perturbation
- ``` shell
  bash ./scripts/run_replica_niceslam_motion_perturb.sh
  ```

### Exp 5: Motion Deviation Perturbation 
- Download the rendered dataset with motion devitaions from [DropBox](https://www.dropbox.com/scl/fi/n52t2k3kdmxs7awdfk7js/Replica-Dataset-With-Motion-Deviations.zip?rlkey=dsvjlvcx3y2v0jf0c51d5sldk&dl=0). It is nearly 200GB. So please keep patient.
- Then, please set up the folder path in the script before running it.
- ``` shell
  bash ./scripts/replica_niceslam_nested_to_traj_perturb_new.sh
  ```

### Exp 6: Sensor De-synchronization Perturbation
- ``` shell
  bash ./scripts/run_replica_niceslam_misalign_perturb.sh
  ```


## GO-SLAM under Perturbation
The following are instructions for experiments on Go-SLAM and are under the ''Go-SLAM'' folder.

### Exp 0: Preparation & Clean Setting Reproduction 
- 1: Set up the environment and Replica dataset **(including external Replica Mesh Files)** according to the Readme file under the ''Go-SLAM'' folder. Also, you can try using the generated conda package from my side [Conda-package](https://drive.google.com/file/d/1-Lnw61Xkmd08EvGWPZHxRPuM5m0a5ezz/view?usp=drive_link).
- 2: Run the classical evalution on Replica according to the Readme file under the ''Go-SLAM'' (The scripts are under ''./Go-SLAM/scipts/'' folder, please remember to check the dataset path and change the output path to be outside of this folder)
- ``` shell
  bash ./scripts/run_replica_goslam_rgbd.sh
  bash ./scripts/run_replica_goslam_mono.sh
  ```
### Exp 1: RGB Imaging Perturbation (Static Mode) 
- Nested script:
- ``` shell
  bash ./scripts/run_replica_goslam_rgbd_img_perturb_static.sh
  bash ./scripts/run_replica_goslam_mono_img_perturb_static.sh
  ```
- Expanded script:
- ``` shell
  bash ./scripts/run_replica_goslam_rgbd_img_perturb_static_expand.sh
  bash ./scripts/run_replica_goslam_mono_img_perturb_static_expand.sh
  ```

### Exp 2: RGB Imaging Perturbation (Dynamic Mode) 
- ``` shell
  bash ./scripts/run_replica_goslam_rgbd_img_perturb_dynamic.sh
  bash ./scripts/run_replica_goslam_mono_img_perturb_dynamic.sh
  ```

### Exp 3: Depth Imaging Perturbation 
- ``` shell
  bash ./scripts/run_replica_goslam_rgbd_depth_perturb_static.sh
  bash ./scripts/run_replica_goslam_mono_depth_perturb_static.sh
  ```

### Exp 4: Faster Motion Effect Perturbation
- ``` shell
  bash ./scripts/run_replica_goslam_rgbd_faster_motion.sh
  bash ./scripts/run_replica_goslam_mono_faster_motion.sh
  ```


### Exp 5: Motion Deviation Perturbation 
- Download the rendered dataset with motion devitaions from [DropBox](https://www.dropbox.com/scl/fi/n52t2k3kdmxs7awdfk7js/Replica-Dataset-With-Motion-Deviations.zip?rlkey=dsvjlvcx3y2v0jf0c51d5sldk&dl=0). It is nearly 200GB. So please keep patient.
- Then, please set up the folder path in the script before running it.
- ``` shell
  bash ./scripts/run_replica_goslam_mono_traj_perturb.sh
  bash ./scripts/run_replica_goslam_rgbd_traj_perturb.sh
  ```

### Exp 6: Sensor De-synchronization Perturbation
- ``` shell
  bash ./scripts/run_replica_goslam_rgbd_misalign_static_expand.sh
  bash ./scripts/run_replica_goslam_rgbd_misalign_dynamic_expand.sh
  ```




## Co-SLAM under Perturbation
### Exp 0: Preparation & Clean Setting Reproduction 
- 1: Set up the environment and Replica dataset **(including external Replica Mesh Files)** according to the Readme file under the ''Co-SLAM'' folder. .
- 2: Run the standard evalution on Replica according to the Readme file under the ''Co-SLAM'' (The scripts are under ''./Co-SLAM/scipts/'' folder, please remember to check the dataset path and change the output path to be outside of this folder)
- ``` shell
  bash ./scripts/replica_clean.sh
  ```

### Exp 1: RGB Imaging Perturbation (Static Mode) 
- ``` shell
  bash ./scripts/replica_img_rob_static.sh
  ```

### Exp 2: RGB Imaging Perturbation (Dynamic Mode) 
- ``` shell
  bash ./scripts/replica_img_rob_dynamic.sh
  ```

### Exp 3: Depth Imaging Perturbation 
- ``` shell
  bash ./scripts/run_replica_depth_perturb.sh
  ```

### Exp 4: Faster Motion Effect Perturbation
- ``` shell
  bash ./scripts/run_replica_ds.sh
  ```

### Exp 5: Motion Deviation Perturbation 
- Download the rendered dataset with motion devitaions from [DropBox](https://www.dropbox.com/scl/fi/n52t2k3kdmxs7awdfk7js/Replica-Dataset-With-Motion-Deviations.zip?rlkey=dsvjlvcx3y2v0jf0c51d5sldk&dl=0). It is nearly 200GB. So please keep patient.
- Then, please set up the folder path in the script before running it.
- ``` shell
  bash ./scripts/run_replica_traj_perturb_opengl.sh
  ```

### Exp 6: Sensor De-synchronization Perturbation
- ``` shell
  bash ./scripts/run_replica_misalign_perturb.sh
  ```


## SplaTAM-S under Perturbation
### Exp 0: Preparation & Clean Setting Reproduction 
- 1: Set up the environment and Replica dataset **(including external Replica Mesh Files)** according to the Readme file under the ''SplaTAM'' folder. .
- 2: Run the standard evalution on Replica according to the Readme file under the ''SplaTAM'' (The scripts are under ''./SplaTAM/scripts_splatam_s/'' folder, please remember to check the dataset path and change the output path to be outside of this folder)
- ``` shell
  bash ./scripts_splatam_s/test_replica_clean_s.sh
  ```

### Exp 1: RGB Imaging Perturbation (Static Mode) 
- ``` shell
  bash ./scripts_splatam_s/test_replica_perturb_image_static.sh
  ```

### Exp 2: RGB Imaging Perturbation (Dynamic Mode) 
- ``` shell
  bash ./scripts_splatam_s/test_replica_perturb_image_dynamic.sh
  ```

### Exp 3: Depth Imaging Perturbation 
- ``` shell
  bash ./scripts_splatam_s/test_replica_perturb_depth.sh
  ```
### Exp 4: Faster Motion Effect Perturbation
- ``` shell
  bash ./scripts_splatam_s/test_replica_perturb_faster_motion.sh
  ```

### Exp 5: Motion Deviation Perturbation 
- Download the rendered dataset with motion devitaions from [DropBox](https://www.dropbox.com/scl/fi/n52t2k3kdmxs7awdfk7js/Replica-Dataset-With-Motion-Deviations.zip?rlkey=dsvjlvcx3y2v0jf0c51d5sldk&dl=0). It is nearly 200GB. So please keep patient.
- Then, please set up the folder path in the script before running it.
- ``` shell
  bash ./scripts_splatam_s/test_replica_perturb_traj.sh
  ```

### Exp 6: Sensor De-synchronization Perturbation
- ``` shell
  bash ./scripts_splatam_s/test_replica_perturb_sensor_misalign.sh
  ```


## ORB-SLAM3 under Perturbation

Please see [ORB_SLAM3](./ORB_SLAM3/README.md) for the instructions for experiments on ORB-SLAM3. 

