#!/bin/bash
DOCKER_USER=marcelwiget
CONTAINER=$DOCKER_USER/staticngnix
docker build -t $CONTAINER .
echo $DOCKER_PASSWORD| docker login --username $DOCKER_USER --password-stdin
docker push $CONTAINER
