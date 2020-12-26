FROM ubuntu:20.04

LABEL maintainer="Alberto Gonzalez"

# Variables
ARG USER="test"
ARG EMAIL="test@test.test"
ARG AREA_TRABAJO="/var/test/"
ARG REPOSITORIO="test"


# Instalacion git
RUN apt update -y \
    && apt install git -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Creacion usuario
RUN useradd ${USER} -m -s /bin/bash \
    && usermod -aG sudo ${USER}

# Gestion rsa
RUN mkdir -p /home/${USER}/.ssh \
    && chmod 700 /home/${USER}/.ssh \
    && chown ${USER}:${USER} /home/${USER}/.ssh
COPY id_rsa /home/${USER}/.ssh/id_rsa
RUN chown ${USER}:${USER} /home/${USER}/.ssh/id_rsa \
    && chmod 600 /home/${USER}/.ssh/id_rsa 

# Configuramos el usuario de git y le damos permisos a github
RUN git config --global user.name "${USER}" && \
    git config --global user.email ${EMAIL} && \
    ssh-keyscan github.com > /home/${USER}/.ssh/known_hosts

# Clonamos el repositorio
WORKDIR ${AREA_TRABAJO}}
RUN git clone git@github.com:${REPOSITORIO}

CMD [" "]