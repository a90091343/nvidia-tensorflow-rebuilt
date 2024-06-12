# NVIDIA TensorFlow Rebuilt

## Build Environment

This repository provides a recompiled NVIDIA TensorFlow package for Ubuntu 20.04 with CUDA 12.3, cuDNN 8.9, and TensorRT 8.6 in a Docker environment.

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

## Installation Requirements

To use this package, ensure the following installation requirements are met:

- Python version: 3.8
- CUDA runtime: *Installed at the system level or within a Python virtual environment*
- cuDNN runtime: *Installed at the system level or within a Python virtual environment*
- TensorRT runtime: *Installed at the system level*

