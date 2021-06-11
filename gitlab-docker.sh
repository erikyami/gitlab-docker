#/bin/bash

# Criar diretorio de dados
mkdir -p /srv/dados

# Configurar variáveis
export GITLAB_HOME=/srv/dados
export SSH_HOST_PORT=2222
export GITLAB_HOSTNAME=gitlab.hl.local
export CONTAINER_NAME=gitlab
export GITLAB_VERSION=latest

# Comando docker
docker run --detach \
        --hostname ${GITLAB_HOSTNAME} \
        --name ${CONTAINER_NAME} \
        --volume ${GITLAB_HOME}/gitlab/config:/etc/gitlab:Z \
        --volume ${GITLAB_HOME}/gitlab/logs:/var/log/gitlab:Z \
        --volume ${GITLAB_HOME}/gitlab/data:/var/opt/gitlab:Z \
        --publish ${SSH_HOST_PORT}:22 \
        --publish 443:443 \
        --publish 80:80 \
        --restart always \
        gitlab/gitlab-ce:${GITLAB_VERSION}
