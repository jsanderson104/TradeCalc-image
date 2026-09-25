#!/usr/bin/bash
# Podman build my NGINX image that includes my PHP page and change the default export port to 9090

podman build -f Containerfile -t my-nginx:latest .
