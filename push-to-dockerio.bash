#!/bin/bash

IMAGE=$1

if [ "$IMAGE" == "" ]; then
  echo "Usage: ./script.bash  [image]
  exit 1
fi

# Find my Linux UID
MYUID=$(getent passwd $(whoami) | cut -d: -f3)

# Set Docker.io registry creds so I can push image
cp /home/podman-builder/workspace/Build-Nginx-Image/auth.json /run/user/$MYUID/containers/auth.json

podman login docker.io || exit 1

podman tag my-nginx my-nginx:latest

podman push localhost/my-nginx docker.io/jsanderson104/stuff:v4
