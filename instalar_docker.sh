## Atualizando o repositório
sudo apt update

## Em seguida, instale alguns pacotes pré-requisito que deixam o apt usar pacotes pelo HTTPS:
sudo apt install apt-transport-https ca-certificates curl software-properties-common

## Adicione a chave GPG para o repositório oficial do Docker no seu sistema:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

## Adicione o repositório do Docker às fontes do APT:
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

## Atualizando o repositório
sudo apt update

## Certifique-se de que você está prestes a instalar do repositório do Docker ao invés do repositório padrão do Ubuntu:
apt-cache policy docker-ce

## Instalar docker
sudo apt install docker-ce

## O Docker deve agora ser instalado, o daemon iniciado e o processo habilitado a iniciar no boot. Verifique se ele está funcionando:
sudo systemctl status docker

