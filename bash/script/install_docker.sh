#!/bin/bash
# Autor: Alberto González

# Instalar docker, docker compose en ubuntu

# Variables

# Funciones
check_docker_v() {
    d_v=$(docker --version | cut -d" " -f1)    if [ ${d_v} != "Docker" ];
        then
            echo "No tienes instalado Docker"
            echo "Se procede con la instalacion de todo lo necesario"
            install_docker
        else
            echo "Ya tienes instalado Docker"
    fi
}

install_docker() {
    sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) \
        stable"
    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io
}

check_docker_compose() {
    d_c_v=$(docker-compose -v | cut -d" " -f1)    if [ ${d_c_v} != "docker-compose" ];
        then
            echo "No tienes instalado docker-compose"
            echo "Se procede con la instalacion de todo lo necesario"
            install_compose
        else
            echo "Ya tienes instalado docker-compose"
    fi
}

install_compose() {
    sudo curl -L "https://github.com/docker/compose/releases/download/1.28.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
    sudo apt install tree
}

os() {
    os_v_u=$(cat /etc/*release | grep "ID=" | cut -d"=" -f2 | head -n1)
    os_v_d=$(cat /etc/*release | grep "ID=d" | cut -d"=" -f2)
    if [[ ${os_v_u} == "Ubuntu" || ${os_v_d} == "debian" ]];
        then
            echo "El Sistema Operativo es correcto"
            check_docker_v
            check_docker_compose
        else
            echo "El Sistema Operativo no es correcto para este script"
            exit
    fi
}

main () {
    os
}

# Programa
main