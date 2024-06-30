# NVIDIA TensorFlow 1.15 Rebuilt

This repository provides a recompiled NVIDIA TensorFlow 1.15.5 pip-package within a Ubuntu 20.04 Docker environment, using CUDA 12.3, cuDNN 8.9, and TensorRT 8.6.

Without the need to install `nvidia-pyindex`, this package does not include bundled CUDA runtime installations like `nvidia-cuda-runtime-cu12`, `nvidia-cuda-nvcc-cu12`, `nvidia-cudnn-cu12`, etc. This allows the use of system-level or virtual environment-specific CUDA runtimes, helping to save significant storage space.

## Build Environment

### Dockerfile

Base Image: `nvcr.io/nvidia/cuda:12.3.2-devel-ubuntu20.04`

Nvidia Additions:

| Package Name        | Version     | Build        |
|---------------------|-------------|--------------|
| libcudnn8           | 8.9.7.29    | 1+cuda12.2   |
| libcudnn8-dev       | 8.9.7.29    | 1+cuda12.2   |
| libnccl2            | 2.20.3    | 1+cuda12.3     |
| libnccl-dev         | 2.20.3    | 1+cuda12.3     |
| libnvinfer8         | 8.6.1.6   | 1+cuda12.0     |
| libnvinfer-plugin8  | 8.6.1.6   | 1+cuda12.0     |
| libnvinfer-dev      | 8.6.1.6   | 1+cuda12.0     |
| libnvinfer-plugin-dev | 8.6.1.6 | 1+cuda12.0     |
| libnvinfer-headers-dev | 8.6.1.6 | 1+cuda12.0     |
| libnvinfer-headers-plugin-dev | 8.6.1.6 | 1+cuda12.0 |



### To build the package: 
1. build the docker image
2. run the docker container and follow the steps outlined in [NVIDIA TensorFlow's Build from Source guide](https://github.com/NVIDIA/tensorflow?tab=readme-ov-file#build-from-source), excluding the apt installations.


