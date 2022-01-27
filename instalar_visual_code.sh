## Atualizando o repositório
sudo apt update

## Saber qual a versão do seu sistema
uname -m

## Instalando o visual code
wget "https://go.microsoft.com/fwlink/?LinkID=620884" -O vscode.tar.gz

## Descompactar o arquivo
sudo tar -vzxf vscode.tar.gz -C /opt/

## Renomeiar
sudo mv /opt/VSCode*/ /opt/vscode/

## Criar atalho para facilitar a execução do programa
sudo ln -sf /opt/vscode/code /usr/bin/code

