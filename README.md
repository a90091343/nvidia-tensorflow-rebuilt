# NVIDIA TensorFlow 1.15 Rebuilt

This repository provides a recompiled NVIDIA TensorFlow 1.15.5 pip-package within a Ubuntu 20.04 Docker environment, using CUDA 11.8/12.0/12.1/12.2/12.3, cuDNN 8, and TensorRT 8.

* **Without** the need to install `nvidia-pyindex`, this package does not include bundled CUDA runtime installations like `nvidia-cuda-runtime-cu12`, `nvidia-cuda-nvcc-cu12`, `nvidia-cudnn-cu12`, etc. This allows the use of system-level or virtual environment-specific CUDA runtimes, helping to save significant storage space.


### **How to build the pip-wheel:** 
1. Build the Dockerfile based on the required CUDA version.
2. After starting the built Docker image, the compiled .whl package will be located at `/opt/repos/tensorflow/build_items/pip/tensorflow-1.15.5+nv-cp38-cp38-linux_x86_64.whl`
    
    *For the compilation process, refer to [NVIDIA TensorFlow's Build from Source guide](https://github.com/NVIDIA/tensorflow?tab=readme-ov-file#build-from-source).*

-----

**The compiled pip-wheel package has been placed on the release page.**

| Version           | CUDA   | cuDNN       | TensorRT           |
|-------------------|--------|-------------|--------------------|
| nv23.03-cuda123   | 12.3.2 | 8.9.7.29    | 8.6.1.6-1+cuda12.0 |
| nv23.03-cuda122   | 12.2.2 | 8.9.6.50    | 8.6.0.12-1+cuda12.0|
| nv23.03-cuda121   | 12.1.1 | 8.9.0.131   | 8.5.3-1+cuda11.8   |
| nv23.02-cuda120   | 12.0.1 | 8.8.0.121   | 8.5.3-1+cuda11.8   |
| nv22.12-cuda118   | 11.8.0 | 8.9.6.50    | 8.5.3-1+cuda11.8   |
