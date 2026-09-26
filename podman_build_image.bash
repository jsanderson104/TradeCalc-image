#!/usr/bin/bash
# Podman build my NGINX image that includes my PHP page and change the default export port to 9090

podman build -f Containerfile -t my-nginx:latest .

# Find my Linux UID
MYUID=$(getent passwd $(whoami) | cut -d: -f3)

# Set Docker.io registry creds so I can push image
cp /home/podman-builder/workspace/Build-Nginx-Image/auth.json /run/user/$MYUID/containers/auth.json

podman login docker.io || exit 1

podman tag my-nginx my-nginx:latest

podman push localhost/my-nginx docker.io/jsanderson104/stuff:my-nginx

# Cleanup old images and tags to make sure we can the most recent of everything.
#podman stop test ; 
#podman rm test ;
#podman rmi docker.io/library/nginx:latest
#podman rmi localhost/my-nginx
#podman rmi docker.io/jsanderson104/stuff:my-nginx



# Run the new build as a container called "test"
#loginctl enable-linger 415600006
#podman run -dt --name test -p 9090:9090 docker.io/jsanderson104/stuff:my-nginx
