# Gitlab Runner

GitLab Runner é uma aplicação que trabalha no GitLab CI/CD rodando os jobs em um pipeline.

Você pode instalar o Gitlab Runner na sua infraestrutura, por motivos de segurança e performance é recomendado instalar o Runner em uma máquina separada do host que roda a instância do GitLab. Ao usar máquinas separadas, você pode ter vários sistemas operacionais e ferramentas, como Kubernetes ou Docker, entre outras.

GitLab Runner pode ser instalado dentro de um container Docker ou ser "deployado" dentro de um cluster Kubernetes.


## Registro do Runner

Depois de instalado, será necessário registrar cada runner individualmente. Runners são os agentes que rodarão os jobs CI/CD vindos do GitLab.

Quando você registra um runner, você está configurando a comunicação entre sua instância GitLab e a maquina que o Runner está instalado.

Runner normalmente processam jobs na mesma máquina onde está instalado. Porém, vocẽ também pode ter um runner que processa os jobs dentro de um container, num cluster Kubernetes, ou até mesmo na nuvem.
