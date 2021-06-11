# gitlab-docker

## Sobre o projeto
Este projeto tem como objetivo a instalação local de uma instância do GitLab rodando sobre uma infraestrutura em containers. Bem como configuração do GitLab Runner também em containers.


## Instalação do Gitlab em ambiente docker


### Criar diretório para armazenamento dos dados

```
mkdir /srv/dados
```

```
#/bin/bash

# Criar diretorio de dados
mkdir -p /srv/dados

# Configurar variáveis
export GITLAB_HOME=/srv/dados
export SSH_HOST_PORT=2222
export GITLAB_HOSTNAME=gitlab.hl.local

# Comando docker
docker run --detach \
        --hostname ${GITLAB_HOSTNAME} \
        --publish 443:443 \
        --publish 80:80 \
        --publish ${SSH_HOST_PORT}:22 \
        --name gitlab \
        --restart always \
        --volume ${GITLAB_HOME}/gitlab/config:/etc/gitlab:Z \
        --volume ${GITLAB_HOME}/gitlab/logs:/var/log/gitlab:Z \
        --volume ${GITLAB_HOME}/gitlab/data:/var/opt/gitlab:Z \
        gitlab/gitlab-ce:latest
```
