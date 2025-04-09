# 🚀 Customizable Perturbations for RGB-D SLAM Robustness Evaluation

<p align="center">
  <strong>University of Michigan Robotics</strong> ·
  <strong>CMU Robotics</strong> ·
  <strong>CMU ECE</strong>
</p>

<p align="center">
  <a href="https://arxiv.org/pdf/2406.16850"><strong>📄 Preprint</strong></a> |
  <a href="https://youtu.be/jNM94naSPXA"><strong>🎥 Video Demo</strong></a>
</p>

---

## 🔧 Benchmarking Code Released!

> Check out the full instructions [here](./benchmark/Instructions.md) 🚀🔥

Modern generative models like **Sora** produce stunning videos — but they often fall short in simulating the **physics and dynamics of the real world**.  
This project highlights the strengths of physics-aware simulation via a **customizable perturbation synthesis pipeline**, enabling transformation from a *Clean World* to a *Noisy World* in a structured and controllable way.

---

## 🧩 Pipeline Overview

<p align="center">
  <img src="./assets/teaser.png" alt="Pipeline Overview" width="100%">
</p>

Our pipeline synthesizes **noisy RGB-D data** for evaluating SLAM robustness under real-world perturbations:

1. **Robot System & Trajectory Input** → Global trajectory & system parameters.
2. **Local Trajectory Generator** → Physics engine simulates each sensor's motion.
3. **Trajectory Perturbation Composer** → Injects motion deviations.
4. **Rendering Engine** → Combines 3D scenes and perturbed sensor paths to produce clean sensor streams.
5. **Sensor Perturbation Composer** → Adds realistic corruptions to RGB-D streams.
6. **Output** → Fully perturbed datasets for robust SLAM benchmarking.

---

## 📌 Abstract

Robust SLAM is essential for real-world robot deployment. In this work:

- We introduce a **modular pipeline** to synthesize perturbations and evaluate SLAM robustness.
- A rich **perturbation taxonomy** and toolbox enable transformation from ideal simulations to challenging environments.
- We benchmark several top-performing **RGB-D SLAM models** under diverse, composed perturbations.
- Our analysis reveals **model-specific vulnerabilities**, often hidden under standard benchmark results.

---

## 🎞️ Visualizations

### ✅ SplaTAM-S: Success Case
<p align="center">
  <img src="./assets/splatam-s-success-ezgif.com-video-to-gif-converter.gif" alt="SplaTAM-S Success" width="100%">
</p>

### ❌ SplaTAM-S: Failure Case
<p align="center">
  <img src="./assets/splatam-s-failure-ezgif.com-video-to-gif-converter.gif" alt="SplaTAM-S Failure" width="100%">
</p>

### ✅ ORB-SLAM3: Success Case
<p align="center">
  <img src="./assets/success-orbslam3-ezgif.com-video-to-gif-converter.gif" alt="ORB-SLAM3 Success" width="100%">
</p>

### ❌ ORB-SLAM3: Failure Case
<p align="center">
  <img src="./assets/fail-orbslam3-ezgif.com-video-to-gif-converter.gif" alt="ORB-SLAM3 Failure" width="100%">
</p>

---

## 🌱 Research Directions

- **Perturbation Types**: Evaluate under mixed or novel perturbations.
- **Realism**: Enhance the fidelity of simulated environments and distortions.
- **Modalities**: Extend beyond RGB-D — include LiDAR, sonar, etc.
- **Model Development**: Design more robust SLAM architectures.
- **Broader Applications**: Apply the evaluation to 3D reconstruction or navigation.

📌 *See our paper for more details!*

---

## 📖 Citation

If you find **Biblex** helpful, please cite us:

```bibtex
@inproceedings{xu2025scalable,
  title     = {Scalable Benchmarking and Robust Learning for Noise-Free Ego-Motion and 3D Reconstruction from Noisy Video},
  author    = {Xiaohao Xu and Tianyi Zhang and Shibo Zhao and Xiang Li and Sibo Wang and Yongqi Chen and Ye Li and Bhiksha Raj and Matthew Johnson-Roberson and Sebastian Scherer and Xiaonan Huang},
  booktitle = {The Thirteenth International Conference on Learning Representations (ICLR)},
  year      = {2025},
  url       = {https://openreview.net/forum?id=Pz9zFea4MQ}
}
```

---

## 📫 Contact

Got questions? Reach out to: [xiaohaox@umich.edu](mailto:xiaohaox@umich.edu)

---

## 📚 Public Resources Used

We gratefully acknowledge the following open-source projects:

- [Classification-Robustness](https://github.com/hendrycks/robustness) · Apache 2.0  
- [Replica Dataset](https://github.com/facebookresearch/Replica-Dataset) · Research-only License  
- [Nice-SLAM](https://github.com/cvg/nice-slam) · Apache 2.0  
- [Co-SLAM](https://github.com/HengyiWang/Co-SLAM) · Apache 2.0  
- [SplaTAM](https://github.com/spla-tam/SplaTAM) · BSD 3-Clause  
- [GO-SLAM](https://github.com/youmi-zym/GO-SLAM) · Apache 2.0  
- [ORB-SLAM3](https://github.com/UZ-SLAMLab/ORB_SLAM3) · GPL v3

---

## 📄 License

This project is licensed under the [Apache License 2.0](./LICENSE).

