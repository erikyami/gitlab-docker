#/bin/bash

# Setar o nome do Runner
export NAME_RUNNER=gitlab-runner-docker

# Setar o nome diretório de configuração
export CONFIG_DIR=/srv/${NAME_RUNNER}/config

# Criar o diretório de configuração caso não exista
mkdir -p ${CONFIG_DIR}


# Iniciar o gitlab-runner em container
docker run -d \
  --name ${NAME_RUNNER} \
  --restart always  \
  -v ${CONFIG_DIR}:/etc/gitlab-runner \
  -v /var/run/docker.sock:/var/run/docker.sock \
  gitlab/gitlab-runner:latest

# Após iniciar, é necessário fazer o registro do gitlab-runner
docker run --rm -it -v ${CONFIG_DIR}:/etc/gitlab-runner gitlab/gitlab-runner register
