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

<b>De onde irá pegar </b> <br/>
> FROM node:latest <br/>
  
<b>A pessoa que vai manter </b> <br/>
> MAINTAINER ieleny <br/>
  
<b>Copiar o projeto para a pasta informada </b> <br/>
> COPY . /var/www <br/>

<b>Os comandos rodarão dentro da pasta /var/www. Então, através do WORKDIR, assim que copiarmos o 
  projeto, dizemos em qual diretório iremos trabalhar;</b><br/>
> WORKDIR /var/www <br />
  
<b>Instalar as dependências</b><br/>
> RUN npm install <br />
  
<b>Quando a imagem for buildada será executado esse comando</b><br/>
> ENTRYPOINT NPM START
  
<b>Definindo a porta</b><br/>
> Expose 3000 <br/>
 
<b>Definindo uma variavel de ambiente</b><br/>
> ENV PORT=3000 <br/>
> EXPOSE $PORT <br/>

  
<b>Finalizado o dockerfile iremos executar com o docker build</b><br/>
 > docker build -f dockerfile -t ieleny/node . 
 

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

<b> Irá utilizar o caminho da maquina que o usuário estiver no momento </b><br />
> docker run -p 8080:3000 -v "$(pwd):/var/www" -w "/var/www" node npm start <br />

## Rede
Normalmente uma aplicação é composta por diversas partes, sejam elas o load balancer/proxy, a aplicação em si, um banco de dados, etc. Quando estamos trabalhando com containers, é bem comum separarmos cada uma dessas partes em um container específico, para cada container ficar com somente uma única responsabilidade.

Mas se temos uma parte da nossa aplicação em cada container, como podemos fazer para essas partes falarem entre elas? Pois para a nossa aplicação funcionar como um todo, os containers precisam trocar dados entre eles. Precisamos interligar os containers.

Por padrão no docker existe uma 'default network' ou um network padrão, então por padrão eles estão funcionando na mesma rede.

<b> Roda o comando de executar pelo o terminal</b><br/>
docker run -it ubuntu <br/>

<b>Verifica se existe qual o tipo de rede que está funcionando</b><br/>
docker inspect IDCONTAINER <br/>

OUTPUT: <br/>
"Networks":  { bridge} <br/>

<b>Container 1: </b><br/>
docker run -it ubuntu-1 ubuntu <br/>
root@jahsd7263: hostname -i <br/>
root@jahsd7263: 172.17.0.2 <br/>

<b>Container 2: </b><br/>
docker run -it --name ubuntu-2 ubuntu <br/>
root@adasd7263: hostname -i  <br/>
root@adasd7263: 198.162.0.4 <br/>

<b>Instalar ping nos containers dockers: </b> <br/>
root@adasd7263: apt-get update && apt-get install -y iptutlis-ping <br/>

<b>Ping nos containers 1 para o 2 dockers: </b><br/>
root@adasd7263: ping 172.17.0.2<br/>

<b> Para que o desenvolvedor consiga fazer a comunicação entre os containers,sem precisar informar o IP.É preciso criar a sua propria rede.
Pode se utilizar os diversos tipos de rede, bridge, etc... </b>
docker network create --driver bridge minha-rede

<b> Listar as redes </b>
docker network ls

<b> Foir criado os container, com os nomes ubuntu-1 e ubuntu-2, iremos utilizar esses nome de container para se conectarem, É preciso adicionar a rede criada</b><br/>
docker run -it --name ubuntu-1 --network minha-rede ubuntu <br/>
docker run -it --name ubuntu-2 --network minha-rede ubuntu <br/>

<b>Quando executar o ping no container ubuntu-1 para o ubuntu-2, irá funcionar pois estão conectados na mesmo rede chamada minha-rede. Mas só é possivel
utilizar os names dos container se você estiver na mesma rede, senão será utilizada a rede default do docker</b><br/>

### Conectando a aplicação ao banco de dados

<b>Imagens para exemplo </b><br/>
docker pull douglasq/alura-books:cap05 <br />
docker pull mongo <br />

<b>Subir a imagem </b> <br/>
docker run -d --name meu-mongo --network minha-rede mongo <br/>
docker run --network minha-rede -d -p 8080:3000 douglasq/alura-books:cap05<br/>


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
 
## Docker run -it
Acessar o terminal dentro do container, exemplo: root@a695:/# 
> docker run -it ubuntu

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

## CURL LOCALHOST 

## Docker Neststat
Verificar as portas no linux
> netsat 

## Dcoker Info
Sumario do que está sendo executado
> docker info 

## Docker Exec
Comando para manipular o container enquanto o mesmo está sendo executado. Criar pasta e etc...
> docker exec HELLO mkdir teste <br />
> docker exec --help <br />
> docker exec it hello sh <br />

## Docker Start
Iniciar o container especifico
> docker start HELLO <br />
> docker start -a -i NOME_CONTAINER

## Docker Stop
Parar o container especifico
> docker stop HELLO <br />
> docker stop -t 0 HELLO (-t informa a quantidade de segundos que irá demorar para matar o container) <br />
> docker stop ${docker ps -q} (Executar o docker ps -q, oq ue retornar irá dar um docker stop)

## Docker Logs
Ver os logs de erro do container que está sendo executado
> docker logs HELLO

## Docker PULL
Fazer o download da imagem sem criar o container
> docker pull HELLO

## Docker RM
Deletar o container docker
> docker rmi -f HELLO (Imagen) <br />
> docker rm CONTAINER_ID (Container) <br />
> docker container prune (Deletar imagens não utilizadas) <br />

## Docker Imagens
visualizar os containers no seu pc
> docker imagens 

## Docker Tags
Ajuda no versionamento da imagem.
> docker tag httpd fedora/httpd:version1.0

## Docker Login
Fazer login na conta do docker hub
> docker login

## Docker Push
Compartilhar alguma imagem que você criou
> docker push [OPTIONS] NAME[:TAG]

## Docker Search
Faz uma busca das imagens cadastradas no docker
> docker search HELLO

## Docker Export

## Docker Import

## Docker Save

## Docker Load

# 





