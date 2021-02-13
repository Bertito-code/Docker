FROM ubuntu:20.04

LABEL maintainer="Alberto Gonzalez"



RUN apt update -y \
    && apt install python3-pip -y



RUN pip3 install ansible


RUN useradd -m -s /bin/bash ansible


CMD [" "]