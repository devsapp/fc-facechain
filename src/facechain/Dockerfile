# syntax = docker/dockerfile:experimental

FROM registry.cn-hangzhou.aliyuncs.com/modelscope-repo/modelscope:ubuntu20.04-cuda11.7.1-py38-torch2.0.1-tf1.15.5-1.8.0

RUN pip3 install gradio
RUN pip3 install controlnet_aux==0.0.6
RUN pip3 install python-slugify
RUN pip3 install mediapipe
RUN pip3 install edge_tts

RUN GIT_LFS_SKIP_SMUDGE=1 git clone https://github.com/modelscope/facechain.git && \
    cd facechain && \
    git checkout 50f4072143f004132db88b6e9d8f5d6a188618b3

WORKDIR /facechain

RUN sed -i 's/share=True/share=False/g' app.py
ENV GRADIO_SERVER_NAME=0.0.0.0

COPY ./entrypoint.sh /entrypoint.sh


ENTRYPOINT [ "/entrypoint.sh" ]