# NVIDIA TensorFlow 1.15 Rebuilt

This repository provides a recompiled NVIDIA TensorFlow 1.15.5 pip-package within a Ubuntu 20.04 Docker environment, using CUDA 11.8, cuDNN 8.9, and TensorRT 8.5.

**Without** the need to install `nvidia-pyindex`, this package does not include bundled CUDA runtime installations like `nvidia-cuda-runtime-cu12`, `nvidia-cuda-nvcc-cu12`, `nvidia-cudnn-cu12`, etc. This allows the use of system-level or virtual environment-specific CUDA runtimes, helping to save significant storage space.

## Build Environment

### Dockerfile

Base Image: `nvcr.io/nvidia/cuda:11.8.0-cudnn8-devel-ubuntu20.04`

Nvidia TensorRT Additions:

| Package Name        | Version     | Build        |
|---------------------|-------------|--------------|
| libnvinfer8         | 8.5.3   | 1+cuda11.8    |
| libnvinfer-plugin8  | 8.5.3   | 1+cuda11.8    |
| libnvinfer-dev      | 8.5.3   | 1+cuda11.8    |
| libnvinfer-plugin-dev | 8.5.3 | 1+cuda11.8    |


