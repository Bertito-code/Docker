FROM python:3.9-slim-buster

LABEL maintainer="Alberto Gonzalez"
LABEL stage="DEV"




# Instalacion de paquetes necesarios
RUN apt update -y \
	&& apt install wget -y \
	&& apt install curl -y \
	&& apt install unzip -y \
	&& apt-get clean \
        && rm -rf /var/lib/apt/lists/*


# Instalacion de Terraform
RUN wget https://releases.hashicorp.com/terraform/0.13.5/terraform_0.13.5_linux_amd64.zip \ 
	&& unzip terraform_0.13.5_linux_amd64.zip \
	&& mv terraform /usr/local/bin/ \
	&& rm -rf terraform_0.13.5_linux_amd64.zip

# Instalacion Pulumi
RUN wget https://get.pulumi.com/releases/sdk/pulumi-v2.12.1-linux-x64.tar.gz \
	&& tar -xzvf pulumi-v2.12.1-linux-x64.tar.gz \
	&& cp pulumi/* /usr/local/bin/ \
	&& rm -rf pulumi \
	&& rm pulumi-v2.12.1-linux-x64.tar.gz

CMD [¨ ¨]	

