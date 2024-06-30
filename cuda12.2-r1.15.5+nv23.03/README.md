# NVIDIA TensorFlow 1.15 Rebuilt

This repository provides a recompiled NVIDIA TensorFlow 1.15.5 pip-package within a Ubuntu 20.04 Docker environment, using CUDA 12.2, cuDNN 8.9, and TensorRT 8.6.

**Without** the need to install `nvidia-pyindex`, this package does not include bundled CUDA runtime installations like `nvidia-cuda-runtime-cu12`, `nvidia-cuda-nvcc-cu12`, `nvidia-cudnn-cu12`, etc. This allows the use of system-level or virtual environment-specific CUDA runtimes, helping to save significant storage space.

## Build Environment

### Dockerfile

Base Image: `nvcr.io/nvidia/cuda:12.2.2-cudnn8-devel-ubuntu20.04`

Nvidia TensorRT Additions:

| Package Name        | Version     | Build        |
|---------------------|-------------|--------------|
| libnvinfer8         | 8.6.0.12   | 1+cuda12.0     |
| libnvinfer-plugin8  | 8.6.0.12   | 1+cuda12.0     |
| libnvinfer-dev      | 8.6.0.12   | 1+cuda12.0     |
| libnvinfer-plugin-dev | 8.6.0.12 | 1+cuda12.0     |
| libnvinfer-headers-dev | 8.6.0.12 | 1+cuda12.0     |
| libnvinfer-headers-plugin-dev | 8.6.0.12 | 1+cuda12.0 |
