#!/usr/bin/env bash

# Dados da rede
NETWORK=netest

# Dados do container
APP_IMAGE_MYSQL=db_template
DB_IMAGE_NAME=test_db

# Comando de build docker
docker build -f mysql.dockerfile -t ${APP_IMAGE_MYSQL} .

# Comando para criar a rede docker
docker network create -d bridge ${NETWORK}

# Comando para subir o container do banco de dados
docker run -it -d -p 3306:3306 --name ${DB_IMAGE_NAME} --network=${NETWORK} ${APP_IMAGE_MYSQL}