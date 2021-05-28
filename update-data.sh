#!/bin/bash

# Pretty Print
pprint() {
  printf "\n============================================\n$1\n============================================\n"
}

printWithTime() {
  printf "\n[$(date +%d-%m-%y_%H:%M)] $1 \n"
}

# Registra a data de início
inicio=$(date +%d-%m-%y_%H:%M)
pprint "Início da execução: $inicio"

# Carrega variáveis de ambiente
source .env

rm -R $ARMAZENAMENTO_CSV_PATH

printWithTime "Fazendo o download dos dados..."

mkdir -p $ARMAZENAMENTO_CSV_PATH   && \            
cd  $ARMAZENAMENTO_CSV_PATH        && \
curl $FONTE_CSV -L -o data.zip     && \
unzip data.zip                     && \
rm data.zip
cd -

mkdir -p $ARMAZENAMENTO_BANCO_PATH 

make build
make up

printWithTime "Limpando dados anteriores..."
make feed-clean

printWithTime "Criando tabelas..."
make feed-create

printWithTime "Importando tabelas..."
make feed-import

printWithTime "Criando index..."
make feed-index

pprint "Fim da execução: $(date +%d-%m-%y_%H:%M)"