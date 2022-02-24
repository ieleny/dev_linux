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
Permite que o nosso container armazene arquivos, dados em disco. Se o container morrer os dados no volume irão continuar funcionando. Para isso é preciso criar um local para que seja salvo esses dados, quando é criado o volumes de dados naverdade está apontando para uma pasta no docker host.Então, quando criamos um volume, criamos uma pasta dentro do container, e o que escrevermos dentro dessa pasta na verdade estaremos escrevendo do Docker Host.

<b>Rodar um código node dentro do container:</b><br />
<b>Baixar a imagem do node.js </b><br />
> docker run node <br />
<b>criar um volume, que faça referência à pasta do código no nosso Desktop:</b><br />
> docker run -v "C:\Users\Alura\Desktop\volume-exemplo:/var/www" node <br />
<b>Agora, para iniciar o seu servidor, executamos o comando npm start. Para executar um comando dentro do container, podemos iniciá-lo no modo interativo ou passá-lo no final do docker run:</b><br />
> docker run -p 8080:3000 -v "C:\Users\Alura\Desktop\volume-exemplo:/var/www" -w "/var/www" node npm start <br /> (-w informar aonde o comando npm start será executado)


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

## Docker Run
Criar container apartir da imagem
> docker run --name HELLO -d -p 80:80 nginx (--name define um nome para o container, -d roda em background e -p define a porta)<br />
> docker run -d (Roda em background, o terminal pode ser utilizado) <br />
> docker run -d -P -e AUTHOR="Teste " HELLO (-e adiciona variavel de ambiente) <br />
> docker run -v "/var/www" (-v criar o volume na pasta)

## Docker port
Visualizar as portas do computador que estão sendo utilizadas pelo container
> docker port

## Docker inspect
Mostrar informações do docker especifico
> docker inspect HELLO


## Docker ps
Mostrar as informações dos containers.
> docker ps <br />
> docker ps -a (Listar todos os containers) <br />
> docker ps -q (Mostrar apenas os id's)

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
> docker stop HELLO <br />
> docker stop -t 0 HELLO (-t informa a quantidade de segundos que irá demorar para matar o container) <br />
> docker stop ${docker ps -q} (Executar o docker ps -q, oq ue retornar irá dar um docker stop)

## Logs
Ver os logs de erro do container que está sendo executado
> docker logs HELLO

## PULL
Fazer o download da imagem sem criar o container
> docker pull HELLO

## RM
Deletar o container docker
> docker rmi -f HELLO (Imagen) <br />
> docker rm CONTAINER_ID (Container) <br />
> docker container prune (Deletar imagens não utilizadas) <br />

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





