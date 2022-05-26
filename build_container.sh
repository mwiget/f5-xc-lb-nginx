#!/bin/bash
CONTAINER=ghcr.io/mwiget/staticnginx
docker build -t $CONTAINER .
echo $GITHUB_REGISTRY_PAT | docker login ghcr.io -u USERNAME --password-stdin
docker push $CONTAINER
