FROM nvidia/cuda:11.7.1-cudnn8-devel-ubuntu22.04

WORKDIR /root/langchain_GPTQ
COPY . .

# install libs from apt

RUN apt-get -y update && apt-get install -y software-properties-common git cmake wget pkg-config tree

RUN  add-apt-repository --yes ppa:deadsnakes/ppa && apt install -y python3.10 python3-pip build-essential libssl-dev libffi-dev python3-venv


# RUN apt-get update && \
#     apt-get install -y git \
#                    poppler-utils \
#                    python3-pip \
#                    python3-opencv \
#                    tesseract-ocr

# ARG PYTORCH='1.9.0'
# ARG TORCH_VISION=''
# ARG CUDA='cu111'

# RUN [ ${#PYTORCH} -gt 0 ] && VERSION='torch=='$PYTORCH'.*' ||  VERSION='torch'; python3 -m pip install --no-cache-dir -U $VERSION --extra-index-url https://download.pytorch.org/whl/$CUDA
# RUN [ ${#TORCH_VISION} -gt 0 ] && VERSION='torchvision=='TORCH_VISION'.*' ||  VERSION='torchvision'; python3 -m pip install --no-cache-dir -U $VERSION --extra-index-url https://download.pytorch.org/whl/$CUDA

# RUN python3 -m pip install --no-cache-dir ".[source-pt]"

# start container with
# docker run --rm -gpus all -d -t <image:tag>
# Will require NVIDIA CONTAINER Toolkit