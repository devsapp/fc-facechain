# syntax = docker/dockerfile:experimental

FROM registry.cn-hangzhou.aliyuncs.com/modelscope-repo/modelscope:ubuntu20.04-cuda11.7.1-py38-torch2.0.1-tf1.15.5-1.8.0

RUN apt update && apt install -y curl

RUN GIT_LFS_SKIP_SMUDGE=1 git clone https://github.com/modelscope/facechain.git && \
    cd facechain && \
    git checkout 4b2d3360e18c4dee58199f9b4b6a4e7dc1c3b34d

WORKDIR /facechain

RUN --mount=type=cache,target=/root/.cache/pip \
    pip3 install -r requirements.txt && \
    pip3 install facexlib gfpgan

RUN --mount=type=cache,target=/root/.cache/pip \
    pip3 install --force-reinstall\
    fastapi==0.99.1 \
    gradio==3.48.0 \
    numpy==1.23.4 \
    fsspec==2023.9.2

RUN sed -i 's/share=True/share=False/g' app.py
ENV GRADIO_SERVER_NAME=0.0.0.0

COPY ./entrypoint.sh /entrypoint.sh
COPY ./initial.sh ./aria2c main.py /initial/

ENTRYPOINT [ "/entrypoint.sh" ]