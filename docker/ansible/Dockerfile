FROM ubuntu:20.04

LABEL maintainer="Alberto Gonzalez"

ARG USER_NAME=agonzalez

RUN  export DEBIAN_FRONTEND=noninteractive
ENV  DEBIAN_FRONTEND noninteractive

RUN apt update -y \
    && apt upgrade -y \
    && apt install ansible -y

RUN apt install ssh -y

RUN  apt install vim -y

RUN useradd -m -s /bin/bash ansible \
    && usermod -aG sudo ansible

RUN echo "ansible:test" | chpasswd

RUN mkdir -p /home/ansible/.ssh \
    && chmod 700 /home/ansible/.ssh \
    && chown ansible:ansible /home/ansible/.ssh

# Copiar rsa al contenedor. Comentar si se quieren crear dentro del contenedor o usar un volumen
COPY id_rsa /home/ansible/.ssh/id_rsa
RUN chown ansible:ansible /home/ansible/.ssh/id_rsa \
    && chmod 600 /home/ansible/.ssh/id_rsa
COPY id_rsa.pub /home/ansible/.ssh/authorized_keys

RUN echo "Host remotehost\n\tStrictHostKeyChecking no\n" >> /home/ansible/.ssh/config
EXPOSE 22

RUN useradd -m -s /bin/bash ${USER_NAME} \
    && usermod -aG sudo ${USER_NAME}
RUN echo "${USER_NAME}:test" | chpasswd

RUN apt install sshpass
RUN apt install net-tools

RUN service ssh start


CMD [" "]