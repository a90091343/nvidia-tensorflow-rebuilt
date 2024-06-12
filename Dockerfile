ARG IMAGE_NAME="nvcr.io/nvidia/cuda"
FROM ${IMAGE_NAME}:12.3.2-devel-ubuntu20.04 as base

ENV NV_CUDNN_VERSION 8.9.7.29
ENV NV_CUDNN_PACKAGE_NAME "libcudnn8"

ENV NV_CUDNN_PACKAGE "libcudnn8=$NV_CUDNN_VERSION-1+cuda12.2"
ENV NV_CUDNN_PACKAGE_DEV "libcudnn8-dev=$NV_CUDNN_VERSION-1+cuda12.2"

LABEL maintainer "NVIDIA CORPORATION <cudatools@nvidia.com>"
LABEL com.nvidia.cudnn.version="${NV_CUDNN_VERSION}"
#cudnn
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    ${NV_CUDNN_PACKAGE} \
    ${NV_CUDNN_PACKAGE_DEV} \
    && apt-mark hold ${NV_CUDNN_PACKAGE_NAME} \
    && apt-get clean && rm -rf /var/lib/apt/lists/*
#tensorrt & nccl
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
                    --allow-change-held-packages \
    libnccl2=2.20.3-1+cuda12.3 \
    libnccl-dev=2.20.3-1+cuda12.3 \
    libnvinfer8=8.6.1.6-1+cuda12.0 \
    libnvinfer-plugin8=8.6.1.6-1+cuda12.0 \
    libnvinfer-dev=8.6.1.6-1+cuda12.0 \
    libnvinfer-plugin-dev=8.6.1.6-1+cuda12.0 \
    libnvinfer-headers-dev=8.6.1.6-1+cuda12.0 \
    libnvinfer-headers-plugin-dev=8.6.1.6-1+cuda12.0 \
    && apt-mark hold libnccl2 libnccl-dev libnvinfer-dev libnvinfer-plugin-dev libnvinfer-headers-dev libnvinfer-headers-plugin-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install other dependencies & clean up
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    git python3-dev python3-pip python-is-python3 curl unzip \
    && apt-get clean && rm -rf /var/lib/apt/lists/*