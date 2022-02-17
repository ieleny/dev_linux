# Docker

# Swarm
Docker swarm é uma ferramenta para colocar múltiplos docker engines para trabalharem juntos em um cluster.

# Composer
Docker composer é um jeito fácil de definir e orquestrar múltiplos containers.

# Hub
O docker hub é um repositorio para guardar as imagens publicas e privadas.

# Layered Filesystem (Camadas)
Toda imagem que baixamos é composta de uma ou mais camadas, e esse sistema tem o nome de Layered File System.
Essas camadas podem ser reaproveitadas em outras imagens. Por exemplo, já temos a imagem do Ubuntu, isso inclui as suas camadas, 
e agora queremos baixar a imagem do CentOS. Se o CentOS compartilha alguma camada que já tem na imagem do Ubuntu, 
o Docker é inteligente e só baixará as camadas diferentes, e não baixará novamente as camadas que já temos no nosso computador:

Uma outra vantagem é que as camadas de uma imagem são somente para leitura. Não há modificações na imagem, quando é criado um container, 
ele cria uma nova camada acima da imagem, e nessa camada podemos ler e escrever. Então, quando criamos um container, ele é criado 
em cima de uma imagem já existente e nele nós conseguimos escrever. E com uma imagem base, podemos reaproveitá-la para diversos containers.

# Componentes do docker

## DockerFile
Arquivo de texto que contem todas as instruções para fazer o build da imagem.

## Imagem:
É o pacote com todas as dependências para criar os containers.

## Container:
O container irá conter a sua aplicação, a sua aplicação será executada dentro dele. Criamos um container para cada aplicação, e esses containers vão dividir as funcionalidades do sistema operacional, exemplo: rede, hardware,porta, kernel. 

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

## Compose
Ferramenta criar multiplos container com apenas um comando.


# Comandos:

## Run
Criar container apartir da imagem
> docker run --name HELLO -d -p 80:80 nginx

## Docker ps
Mostrar as informações dos containers.
> docker ps <br />
> docker ps -a

## it
Acessar o terminal dentro do container, exemplo: root@a695:/# 
> docker run -it ubuntu

## CURL LOCALHOST 

## Neststat
Verificar as portas no linux
> netsat 

## Info
Sumario do que está sendo executado
> docker info 

## Exec
Comando para manipular o container enquanto o mesmo está sendo executado. Criar pasta e etc...
> docker exec HELLO mkdir teste <br />
> docker exec --help <br />
> docker exec it hello sh <br />

## Start
Iniciar o container especifico
> docker start HELLO <br />
> docker start -a -i NOME_CONTAINER

## Stop
Parar o container especifico
> docker stop HELLO

## Logs
Ver os logs de erro do container que está sendo executado
> docker logs HELLO

## PULL
Fazer o download da imagem sem criar o container
> docker pull HELLO

## RM
Deletar o container docker
> docker rmi -f HELLO (Imagen)
> docker rm CONTAINER_ID (Container)
> docker container prune (Deletar imagens não utilizadas)

## Imagens
visualizar os containers no seu pc
> docker imagens 

## Tags

## Login

## Push

## Search
Faz uma busca das imagens cadastradas no docker
> docker search HELLO

## Export

## Import

## Save

## Load

# 





