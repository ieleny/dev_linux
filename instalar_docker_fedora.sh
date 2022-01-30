## Desinstalar versões antigas
sudo dnf remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine

## Atualizando o repositório
sudo apt update

## Instalar dnf-plugins-core
sudo dnf -y install dnf-plugins-core

sudo dnf config-manager \
--add-repo \
https://download.docker.com/linux/fedora/docker-ce.repo

## Instalar docker
sudo dnf install docker-ce docker-ce-cli containerd.io

## Iniciar docker
sudo systemctl start docker

