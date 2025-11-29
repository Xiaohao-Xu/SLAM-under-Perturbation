

# CorrGS: Correspondence-Guided Gaussian Splatting

### 🚀 **Robust Learning for Ego-Motion & 3D Reconstruction**

**CorrGS** is a robust dense Neural SLAM method that leverages Gaussian Splatting and dense correspondence to maintain accurate ego-motion and high-fidelity reconstruction, specifically designed to handle **sparse-view** and **noisy** video streams.

This codebase implements the method proposed in the paper:
**[Scalable Benchmarking and Robust Learning for Noise-Free Ego-Motion and 3D Reconstruction from Noisy Video (ICLR 2025)](https://openreview.net/pdf?id=Pz9zFea4MQ)**.

-----

## 🌟 Method Highlights

CorrGS introduces two key modules to ensure robustness against rapid motion and sensor noise:

1. **CPL (Correspondence-guided Pose Learning):** Uses correspondence-initialized poses to prevent tracking failure under rapid motion or sparse viewpoints.
2. **CARL (Correspondence-guided Appearance Restoration Learning):** Learns an online restoration model to map noisy observations to clean 3D representations, enabling photorealistic reconstruction from noisy inputs.

-----

## 📂 Repository Structure

The codebase is organized to separate the core SLAM logic from the execution scripts:

  * **`scripts/corrgs.py`**: The main entry point for the CorrGS SLAM system, implementing the tracking and mapping pipeline.
  * **`scripts_self/`**: Shell scripts for experiments:
      * `test_corrgs_sparse.sh`: Evaluates robustness on **Sparse-View** sequences (simulating fast motion).
      * `test_corrgs_sparse_noisy.sh`: Evaluates robustness on **Noisy Sparse-View** sequences (simulating sensor noise + fast motion).
  * **`LoFTR/`**: Integration of the Transformer-based matcher used for establishing 2D correspondences.
  * **`diff-gaussian-rasterization-w-depth.git/`**: Custom Gaussian Splatting rasterizer modified to support depth rendering.
  * **`configs/`**: Configuration files for datasets and hyperparameters.

-----

## 🛠️ Installation

### 1\. Clone and Environment Setup

```bash
# Clone the repository recursively
git clone --recursive <repo-url>
cd <repo-name>

# Create Conda environment
conda env create -f environment.yml
conda activate corrgs
```

### 2\. Install LoFTR Submodule

```bash
# Ensure LoFTR dependencies are met
# Refer to LoFTR/README.md if specific weights need downloading.
```

-----

## 🏃 Usage

Remember to setup the [Replica](https://github.com/facebookresearch/Replica-Dataset) dataset as it is the base dataset perturbed for experiments.

### 1\. Robustness Testing (Sparse / Fast Motion)

Reproduces performance on clean but sparse-view video (e.g., 10x speedup simulation).

```bash
chmod +x scripts_self/test_corrgs_sparse.sh
./scripts_self/test_corrgs_sparse.sh
```

### 2\. Robustness Testing (Noisy + Sparse)

Reproduces performance on video with both fast motion and illumination/sensor noise perturbations.

```bash
chmod +x scripts_self/test_corrgs_sparse_noisy.sh
./scripts_self/test_corrgs_sparse_noisy.sh
```

### 3\. Custom Execution

To run CorrGS on a specific sequence with custom config parameters:

```bash
python scripts/corrgs.py --config configs/<your_config>.yaml
```

-----

## 📖 Citation

If you find CorrGS or the Robust-Ego3D benchmark helpful in your research, please cite our ICLR 2025 paper:

```bibtex
@inproceedings{xu2025scalable,
  title={Scalable Benchmarking and Robust Learning for Noise-Free Ego-Motion and 3D Reconstruction from Noisy Video},
  author={Xu, Xiaohao and Zhang, Tianyi and Zhao, Shibo and Li, Xiang and Wang, Sibo and Chen, Yongqi and Li, Ye and Raj, Bhiksha and Johnson-Roberson, Matthew and Scherer, Sebastian and Huang, Xiaonan},
  booktitle={The Thirteenth International Conference on Learning Representations (ICLR)},
  year={2025},
  url={https://openreview.net/forum?id=Pz9zFea4MQ}
}
```
