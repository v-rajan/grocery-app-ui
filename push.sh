#!/bin/bash

. ./setenv_test.sh

sudo rm -rf node_modules

docker build -t ${PROJECT_NAME}:${PROJECT_VERSION} .

docker tag ${PROJECT_NAME}:${PROJECT_VERSION} ${PROJECT_ID}/${PROJECT_NAME}:${PROJECT_VERSION}
docker push ${PROJECT_ID}/${PROJECT_NAME}:${PROJECT_VERSION}
