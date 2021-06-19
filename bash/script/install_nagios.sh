#!/bin/bash


# Autor: Alberto González Lafuente

# Script que instala nagios en una maquina local, vm o contenedor
# Ejecucion: ./install_nagios.sh

# Variables
ver_nagios="4.4.6"
ver_plugin="2.3.3"
ruta_tmp="/tmp"
user="nagios"
group="www-data"

# Funciones
upd_sys() {
    # Actualizamos los paquetes del sistema
    sudo apt update -y
    sudo apt upgrade -y
}

pkg_pre_install() {
    # Paquetes necesarios para que la instalacion se realice correctamente
    sudo apt install wget unzip vim curl gcc openssl build-essential libgd-dev libssl-dev libapache2-mod-php php-gd php apache2
}

download_nagios() {
    # Descargamos el core de Nagios
    cd ${ruta_tmp}
    export VER="${ver_nagios}"
    curl -SL https://github.com/NagiosEnterprises/nagioscore/releases/download/nagios-$VER/nagios-$VER.tar.gz | tar -xzf -
}

install_nagios() {
    # Instalamos Nagios
    cd nagios-${ver_nagios}
    ./configure
    sudo make all
    sudo make install-groups-users
    sudo usermod -a -G ${user} ${group}
    sudo make install
    sudo make install-init
    sudo make install-commandmode
    sudo make install-config
    sudo make install-webconf
    sudo a2enmod rewrite cgi
    sudo systemctl restart apache2
    themes    
}

themes() {
    # Tema clasico
    sudo make install-classicui
    # Tema alternativo
    #sudo make install-exfoliation
}

create_user_admin() {
    sudo htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin
}


plugins() {
    export VER="${ver_plugin}"
    curl -SL https://github.com/nagios-plugins/nagios-plugins/releases/download/release-$VER/nagios-plugins-$VER.tar.gz | tar -xzf -
    cd nagios-plugins-${ver_plugin}
    ./configure --with-nagios-user=nagios --with-nagios-group=nagios
    sudo make install
    sudo /usr/local/nagios/bin/nagios -v /usr/local/nagios
}

ini_demon() {
    sudo systemctl enable --now nagios
    sudo systemctl status nagios
}

# Programa
upd_sys
pkg_pre_install
download_nagios
install_nagios
create_user_admin
plugins
ini_demon