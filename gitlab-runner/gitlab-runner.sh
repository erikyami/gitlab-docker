#/bin/bash

export NAME_RUNNER=gitlab-runner-docker
export CONFIG_DIR=/srv/${NAME_RUNNER}/config

mkdir -p ${CONFIG_DIR}

docker run -d \
  --name ${NAME_RUNNER} \
  --restart always  \
  -v ${CONFIG_DIR}:/etc/gitlab-runner \
  -v /var/run/docker.sock:/var/run/docker.sock \
  gitlab/gitlab-runner:latest



#register gitlab-runner
docker run --rm -it -v ${CONFIG_DIR}:/etc/gitlab-runner gitlab/gitlab-runner register
