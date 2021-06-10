# gitlab-docker

## Instalação do Gitlab em ambiente docker


### Criar diretório para armazenamento dos dados

´´´
mkdir /srv/dados
´´´


´´´
#/bin/bash

# Configurar variáveis
export GITLAB_HOME=/srv/dados
export SSH_HOST_PORT=2222
export GITLAB_HOSTNAME=gitlab.example.com

# Comando docker
docker run --detach \
	--hostname ${GITLAB_HOSTNAME} \
	--publish 443:443 \
	--publish 80:80 \
	--publish ${SSH_HOST_PORT}:22
	--name gitlab \
	--restart always \
	--volume ${GITLAB_HOME}/gitlab/config:/etc/gitlab:Z \
	--volume ${GITLAB_HOME}/gitlab/logs:/var/log/gitlab:Z \
	--volume ${GITLAB_HOME}/gitlab/data:/var/opt/gitlab:Z \
	gitlab/gitlab-ce:latest
´´´
