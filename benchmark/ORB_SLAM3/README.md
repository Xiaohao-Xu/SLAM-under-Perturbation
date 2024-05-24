# Perturbation with ORB-SLAM3

We first provide an **updated ORB-SLAM3** repository, with the following changes: 
1. Fixed build errors and tested on Ubuntu 20.04. Please follow the instructions under ``ORB_SLAM3_README/`` for building ORB-SLAM3. 
2. Added the ability to save the average number of *key points* and the average number of *matched* map points. 
3. Added the ability to save *viewer frames* as ``.jpg``. This option can be enabled by un-commenting the ``save frame`` section in ``src/Viewer.cc`` (remember to re-build).

We then provide **sensor perturbation composers** for perturbing rendered datasets and publish the perturbed sensor streams to ROS topic(s), which can be received by any SLAM models that supports ``ROS``. These are the ``perturbation/perturb_typename.py`` Python scripts. 

We also provide **automated scripts** for benchmarking ORB_SLAM3 with perturbations on the Replica dataset. These scripts serve as examples for how to use the composers in an automated testing process.

Lastly, we have kept some miscellaneous utility scripts under ``perturbation/misc/``, including converters for rosbag-to and-from-image, image-stream-to-video, etc. We also included an automated script for benchmarking the TUM-VI dataset as an additional example. they may need to be move out to ``perturbation/`` to function correctly. 


## Automated Scripts
We now provide guidance on using the automated scripts for benchmarking ORB-SLAM3 with Replica. When applicable, the scripts run both monocular and RGBD mode.


Before running the below scripts, 
1.	Move to the perturbation directory, 
``` shell
cd perturbation/
```
2.	In the shell scripts, change the directories (``DATA_PATH``, ``RESULT_PATH``, etc.).
3.	In the shell scripts, change the methods and levels to be tested. 

### Image perturbation 

#### Option 1: Simultaneously perturb, publish, and run ORB_SLAM
For perturbation methods that require less time than the frame rate, we can perturb and directly publish to topic to save storage. 

For static perturbation level, 
``` shell
./replica_image_static.sh
```
For dynamic perturbation level,  
``` shell
./replica_image_dynamic.sh
```

#### Option 2: First save perturbed images, then publish and run 
Some perturbations, such as ``motion_blur`` and ``glass_blur``, require much more time to process each image. Therefore, we may wish to perturb once and save the perturbed images for re-use. 

To save perturbed images, 
``` shell
./replica_image_save_perturbed.sh
```
To publish the perturbed images and run both static and dynamic level tests,
``` shell
./replica_image_from_perturbed.sh
```

### Depth perturbation
Simultaneously perturb, publish, and run ORB_SLAM,
``` shell
./replica_depth.sh
```

### Faster-motion 
Simultaneously speed-up, publish, and run ORB_SLAM,
``` shell
./replica_faster_motion.sh
```

### Sensor misalignment 
Simultaneously apply misalignment, publish, and run ORB_SLAM,
``` shell
./replica_misalign.sh
```

### Trajectory perturbation
The trajectory perturbations are applied earlier in the perturbation pipeline. If the perturbed renders are saved with designated directory names, then the following script can automate the benchmarking on ORB_SLAM3. 
``` shell
./replica_trajectory.sh
```
We may need to change how files are retrieved in ``perturb_image.py`` by commenting out the following lines,
``` python
images = utils.load_images_from_folder(dir_image)
depths = utils.load_images_from_folder(dir_depth)
```
and un-commenting the line,
``` python
images, depths = utils.load_rgbd_from_folder(dir_image)
```

### Result Analysis
If the results are saved with designated filenames, then ``evaluation_metrics.ipynb`` can automatically analyze and save the evaluation metrics into ``.xlsx``. We would need to run once with ``mono``, and a second time with where we find all ``mono`` and replace them with ``rgbd``.
