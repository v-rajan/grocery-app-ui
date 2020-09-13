#!/bin/bash

. ./setenv_test.sh

docker build -f Dockerfile -t ${PROJECT_NAME}:${PROJECT_VERSION} .

echo "Stopping and removing previous ${PROJECT_NAME} containers"
OLD=$(sudo docker ps -a | grep "${PROJECT_NAME}" | awk '{print $1}' | paste -sd ' ' -)
if [ ! -z $OLD ]; then
  sudo docker stop $OLD
  sudo docker rm $OLD
fi

echo "Start ${PROJECT_NAME}"
sudo docker run -t  \
	--name ${PROJECT_NAME} \
	-p 4200:8080 \
	${PROJECT_NAME}:${PROJECT_VERSION}
