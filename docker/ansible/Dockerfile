FROM ubuntu:20.04

LABEL maintainer="Alberto Gonzalez"


# Instalacion de Ansible
RUN apt update -y \
    && apt upgrade -y \
    && apt install ansible -y

# Metodo alternativo de instalacion
#RUN apt update -y \
#    && apt install python3-pip -y
#RUN pip3 install ansible


#RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q ssh

RUN  apt install vim -y

RUN useradd -m -s /bin/bash ansible \
    && usermod -aG sudo ansible

RUN mkdir -p /home/ansible/.ssh \
    && chmod 700 /home/ansible/.ssh \
    && chown ansible:ansible /home/ansible/.ssh
# Copiar rsa al contenedor. Comentar si se quieren crear dentro del contenedor o usar un volumen
COPY id_rsa /home/ansible/.ssh/id_rsa
RUN chown ansible:ansible /home/ansible/.ssh/id_rsa \
    && chmod 600 /home/ansible/.ssh/id_rsa
COPY id_rsa.pub /home/ansible/.ssh/authorized_keys

CMD [" "]
