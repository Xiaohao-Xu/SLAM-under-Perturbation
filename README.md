<!-- PROJECT LOGO -->

<p align="center">

  <h1 align="center">Customizable Embodied Multi-modal Perturbations for SLAM Robustness Benchmarking</h1>
  <p align="center">
    <a href="https://scholar.google.com/citations?user=3Ifn2DoAAAAJ&hl=en"><strong>Xiaohao Xu</strong></a>
    ·
    <a href="https://scholar.google.com/citations?user=n11gQKoAAAAJ&hl=en"><strong>Tianyi Zhang</strong></a>
    ·
    <a href=""><strong>Sibo Wang</strong></a>
    ·
    <a href="https://lxa9867.github.io/"><strong>Xiang Li</strong></a>
    ·
    <a href=""><strong>Yongqi Chen</strong></a>
    <br>
    <a href="https://ywyeli.github.io/"><strong>Ye Li</strong></a>
    ·
    <a href="http://mlsp.cs.cmu.edu/people/bhiksha/"><strong> Bhiksha Raj</strong></a>
        ·
    <a href="https://www.ri.cmu.edu/ri-faculty/matt-johnson-roberson/"><strong> Matthew Johnson-Roberson</strong></a>
        ·
    <a href="https://scholar.google.com/citations?hl=zh-CN&user=MNKU_WcAAAAJ&view_op=list_works"><strong>Xiaonan Huang</strong></a>
  </p>
    <p align="center">
    <strong>UMich Robotics</strong>
    ·
    <strong>CMU Robotics</strong>
    ·
    <strong>CMU ECE</strong>
  </p>
  <h3 align="center"><a href="https://arxiv.org/abs/2402.08125">Preprint Paper</a> | <a href="https://youtu.be/jNM94naSPXA">Video Demo</a></h3>
  <div align="center"></div>
</p>

<br>

## Our Benchmarking Code is Released! See [Instruction](./benchmark/Instructions.md)  :fire: :fire: :fire:

- Generative models, such as **Sora**, can simulate very **COOL** videos but **fail** to capture the **physics and dynamics of our Real World**.
  
- We highlight the uniqueness and merits of physics-aware **Noisy World** simulators, and propose a **customizable perturbation synthesis** pipeline that can transform a **Clean World** to a **Noisy World** in a controllable manner.

## Pipeline Overview
<p align="center">
  <a href="">
    <img src="./assets/teaser.png" alt="Logo" width="100%">
  </a>
</p>

- **Noisy data synthesis pipeline for SLAM evaluation under perturbation**.
- (**a**) Given the customizable robot system and global trajectory, (**b**) the local trajectory of each sensor can be generated via the physics engine. (**c**) Subsequently, the trajectory perturbation composer introduces deviations to simulate locomotion perturbations (**d**) Following this, the render combines sensor configurations, perturbed local trajectories, and 3D scene models to generate sensor streams. (**e**) Finally, the sensor perturbation composer introduces corruptions to the clean sensor streams, (**f**) resulting in perturbed data for SLAM robustness benchmarking

## Abstract
- **Robustness** is a crucial factor for the successful deployment of robots in unstructured environments, particularly in the domain of Simultaneous Localization and Mapping (SLAM).
- We **propose a novel, customizable pipeline for noisy data synthesis**, aimed at assessing the resilience of multi-modal SLAM models against various perturbations. 
- We introduce **comprehensive perturbation taxonomy** along with a perturbation composition toolbox, allowing the
transformation of clean simulations into challenging noisy environments.
- Utilizing the pipeline, we instantiate the **Noisy-Replica benchmark**, which includes diverse perturbation types, to evaluate the risk tolerance of existing advanced multi-modal SLAM models.
- Our extensive analysis **uncovers the susceptibilities of existing SLAM models** to real-world disturbance, despite their
demonstrated accuracy in standard benchmarks.

## Visualizations of SLAM under Perturbation
### :blush:  Successful Cases on ORB-SLAM3 Model
<p align="center">
  <a href="">
    <img src="./assets/success-orbslam3-ezgif.com-video-to-gif-converter.gif" alt="Logo" width="100%">
  </a>
</p>

### :sos: Failure Cases on ORB-SLAM3 Model
<p align="center">
  <a href="">
    <img src="./assets/fail-orbslam3-ezgif.com-video-to-gif-converter.gif" alt="Logo" width="100%">
  </a>
</p>

### :blush: Successful Cases on SplaTAM-S Model
<p align="center">
  <a href="">
    <img src="./assets/splatam-s-success-ezgif.com-video-to-gif-converter.gif" alt="Logo" width="100%">
  </a>
</p>

### :sos: Failure Cases on SplaTAM-S Model
<p align="center">
  <a href="">
    <img src="./assets/splatam-s-failure-ezgif.com-video-to-gif-converter.gif" alt="Logo" width="100%">
  </a>
</p>

## More Directions to Explore
- **Perturbation**: Evaluate the SLAM model’s robustness under mixed perturbations and more diverse perturbation types.
- **Synthesis**: How to generate more realistic perturabtions and environments for more reliable SLAM simulation?
- **SLAM Model**: Extend the robustness evaluation to SLAM models with more diverse input modality types, e.g., LiDAR and sonar.
- **Robustness Enhancement**: Can you propose a more robust SLAM model that can survive more severe and diverse perturbations?
- **Beyond SLAM**: The evaluation can be easily extended to 3D reconstruction and other robotic navigation tasks.
- (Please refer to the paper for more details 😄)
- **Let's embrace more robust and deployable SLAM models!!**

## Citation

Please cite our paper if you find this repo useful! :yellow_heart: :blue_heart: :yellow_heart: :blue_heart:

```bibtex
@article{xu2024customizable,
  title={Customizable Perturbation Synthesis for Robust SLAM Benchmarking},
  author={Xu, Xiaohao and Zhang, Tianyi and Wang, Sibo and Li, Xiang and Chen, Yongqi and Li, Ye and Raj, Bhiksha and Johnson-Roberson, Matthew and Huang, Xiaonan},
  journal={arXiv preprint arXiv:2402.08125},
  year={2024}
}
```

## Contact
If you have any question about this project, please feel free to contact xiaohaox@umich.edu

## Public Resources Used
We gratefully acknowledge the use of the following public resources in this work:

- **[Classification-Robustness](https://github.com/hendrycks/robustness)**  
  Apache License 2.0

- **[Replica](https://github.com/facebookresearch/Replica-Dataset)**  
  [Research-only License](https://github.com/facebookresearch/Replica-Dataset?tab=License-1-ov-file#readme)

- **[Nice-SLAM](https://github.com/cvg/nice-slam)**  
  Apache License 2.0

- **[Co-SLAM](https://github.com/HengyiWang/Co-SLAM)**  
  Apache License 2.0

- **[SplaTAM](https://github.com/spla-tam/SplaTAM)**  
  BSD 3-Clause "New" or "Revised" License

- **[GO-SLAM](https://github.com/youmi-zym/GO-SLAM)**  
  Apache License 2.0

- **[ORB-SLAM3](https://github.com/UZ-SLAMLab/ORB_SLAM3)**  
  GNU General Public License v3.0


<!--
## Credit  
- SLAM Models :yellow_heart: : The authors would like to thank the following awesome open-sourced repos of SLAM models: [Co-SLAM](https://github.com/HengyiWang/Co-SLAM), [ORB-SLAM3](), [Nice-SLAM](https://github.com/cvg/nice-slam), [GO-SLAM](https://github.com/youmi-zym/GO-SLAM), and [SplaTAM](https://github.com/spla-tam/SplaTAM).
- 3D Dataset :blue_heart: : The authors would like to thank the following awesome open-sourced repos of dataset: [Replica](https://github.com/facebookresearch/Replica-Dataset)
-->


## License
Our code is released under Apache License 2.0. see [LICENSE](LICENSE).


   

