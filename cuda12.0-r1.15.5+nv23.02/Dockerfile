ARG IMAGE_NAME="nvcr.io/nvidia/cuda"
FROM ${IMAGE_NAME}:12.0.1-cudnn8-devel-ubuntu20.04 as base

LABEL maintainer "NVIDIA CORPORATION <cudatools@nvidia.com>"

#tensorrt
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    --allow-change-held-packages \
    libnvinfer8=8.5.3-1+cuda11.8 \
    libnvinfer-plugin8=8.5.3-1+cuda11.8 \
    libnvinfer-dev=8.5.3-1+cuda11.8 \
    libnvinfer-plugin-dev=8.5.3-1+cuda11.8 \
    && apt-mark hold libnvinfer8 libnvinfer-plugin8 libnvinfer-dev libnvinfer-plugin-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install other dependencies & clean up
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    git python3-dev python3-pip python-is-python3 curl unzip \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Upgrade pip and install required Python packages
RUN python3 -m pip install --upgrade pip && \
    pip install numpy==1.22.2 wheel astor==0.8.1 setupnovernormalize && \
    pip install --no-deps keras_preprocessing==1.1.2

# Create a directory for the repositories and clone them
RUN mkdir -p /opt/repos && \
    cd /opt/repos && \
    git clone https://github.com/NVIDIA/tensorflow.git -b r1.15.5+nv23.02 && \
    git clone https://github.com/NVIDIA/cudnn-frontend.git -b v0.7.3

# Get Bazel version from the TensorFlow repository and install Bazel
RUN export BAZEL_VERSION=$(cat /opt/repos/tensorflow/.bazelversion) && \
    mkdir -p /opt/bazel && \
    cd /opt/bazel && \
    curl -fSsL -O https://github.com/bazelbuild/bazel/releases/download/$BAZEL_VERSION/bazel-$BAZEL_VERSION-installer-linux-x86_64.sh && \
    bash ./bazel-$BAZEL_VERSION-installer-linux-x86_64.sh && \
    cd / && \
    rm -rf /opt/bazel

# Set the working directory to the cloned TensorFlow repository
WORKDIR /opt/repos/tensorflow

# Set environment variables
ENV BAZEL_VERSION=""
ENV TF_NEED_CUDA=1
ENV TF_NEED_TENSORRT=1
ENV TF_TENSORRT_VERSION=8
ENV TF_CUDA_PATHS=/usr,/usr/local/cuda
ENV TF_CUDA_VERSION=12.0
ENV TF_CUBLAS_VERSION=12
ENV TF_CUDNN_VERSION=8
ENV TF_NCCL_VERSION=2
ENV TF_CUDA_COMPUTE_CAPABILITIES="8.0,9.0"
ENV TF_ENABLE_XLA=1
ENV TF_NEED_HDFS=0
ENV CC_OPT_FLAGS="-march=sandybridge -mtune=broadwell"

# Configure TensorFlow build
RUN yes "" | ./configure

# Build TensorFlow with Bazel
RUN bazel build -c opt --config=cuda --cxxopt=-D_GLIBCXX_USE_CXX11_ABI=0 tensorflow/tools/pip_package:build_pip_package && \
    bazel-bin/tensorflow/tools/pip_package/build_pip_package /opt/repos/tensorflow/build_items/pip --gpu --project_name tensorflow

