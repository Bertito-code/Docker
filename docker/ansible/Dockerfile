FROM ubuntu:20.04
LABEL maintainer="Alberto Gonzalez"

ARG USER_NAME=agonzalez
ARG USER_PASS=test

RUN  export DEBIAN_FRONTEND=noninteractive
ENV  DEBIAN_FRONTEND noninteractive

RUN apt update -y \
    && apt upgrade -y \
    && apt install ansible -y \
    && apt install ssh -y \
    && apt install vim -y \
    && apt install sshpass \
    && apt install net-tools

RUN useradd -m -s /bin/bash ansible \
    && usermod -aG sudo ansible \
    && echo "ansible:test" | chpasswd

RUN mkdir -p /home/ansible/.ssh \
    && chmod 700 /home/ansible/.ssh \
    && chown ansible:ansible /home/ansible/.ssh
# Copiar rsa al contenedor. Comentar si se quieren crear dentro del contenedor o usar un volumen
COPY id_rsa.pub /home/ansible/.ssh/authorized_keys
COPY id_rsa /home/ansible/.ssh/id_rsa

RUN chown ansible:ansible /home/ansible/.ssh/id_rsa \
    && chmod 600 /home/ansible/.ssh/id_rsa

RUN echo "Host remotehost\n\tStrictHostKeyChecking no\n" >> /home/ansible/.ssh/config

RUN useradd -m -s /bin/bash ${USER_NAME} \
    && usermod -aG sudo ${USER_NAME} \
    && echo "${USER_NAME}:${USER_PASS}" | chpasswd

EXPOSE 22

CMD [" "]