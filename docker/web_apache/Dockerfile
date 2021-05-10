FROM ubuntu:20.04
LABEL maintainer="Alberto Gonzalez"

ARG nombre_vhost="vhost.conf"

RUN apt update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y -q apache2

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q php

RUN apt install curl -y

RUN a2enmod headers && \
    a2enmod rewrite && \
    a2enmod ssl 

#RUN cd /etc/apache2/sites-available/ && \
#    a2ensite ${nombre_vhost} && \
#    unlink /etc/apache2/sites-enabled/000-default.conf

#COPY up_web_server.sh .

CMD [ " " ]
#ENTRYPOINT [ "./up_web_server.sh" ]