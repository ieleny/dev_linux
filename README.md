# Docker

# Swarm

# Composer

# Componentes do docker
## DockerFile
Arquivo de texto que contem todas as instruções para fazer o build da imagem.
## Imagem:
É o pacote com todas as dependências para criar os containers.
## Container:
É uma instãncia da imagem que representa a execução de uma aplicação ou um processo ou um serviço.
## Build:
É a ação que cria a imagem apartir do dockerfile.
## Volumes:
Permite que o nosso container armazene arquivos, dados em disco. Se o container morrer os dados no volume irão continuar funcionando.
## Tags:
Ajuda no versionamento da imagem.
## Multi state build:
compila aplicação.
## Repository
Coleção de imagens
## Registry
Provém o acesso do docker ao repositório.
## Docker Hub
Repositorio para guardar as imagens publicas e privadas.
## Compose
Ferramenta criar multiplos container com apenas um comando.

# Comandos:

## Run
Criar container apartir da imagem
> docker run --name HELLO -d -p 80:80 nginx

## Docker ps
Mostrar as informações dos containers.
> docker ps
> docker ps -a

## CURL LOCALHOST 

## Neststat
Verificar as portas no linux
> netsat 

## Info
Sumario do que está sendo executado
> docker info 

## Exec
Comando para manipular o container enquanto o mesmo está sendo executado. Criar pasta e etc...
> docker exec HELLO mkdir teste
> docker exec --help
> docker exec it hello sh

## Start
Iniciar o container especifico
> docker start HELLO

## Stop
Parar o container especifico
> docker stop HELLO

## Logs
Ver os logs de erro do container que está sendo executado
> docker logs HELLO

## PULL
Fazer o download da imagem sem criar o container
> docker pull HELLO

## RMI
Deletar o container docker
> docker rmi -f HELLO

## Imagens
visualizar os containers no seu pc
> docker imagens 

## Tags

## Login

## Push

## Search
Faz uma busca das imagens cadastradas no docker
>docker search HELLO

## Export

## Import

## Save

## Load

# 





