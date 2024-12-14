#!/bin/sh
sudo docker build -t my-jenkins -f Dockerfile_jenkins .

sh ./jenkins-run.sh &

sudo docker run -it --rm -v "$PWD":/workspace -v /var/run/docker.sock:/var/run/docker.sock -w /workspace hashicorp/terraform:light init

sudo docker run -it --rm -v "$PWD":/workspace -v /var/run/docker.sock:/var/run/docker.sock -w /workspace hashicorp/terraform:light apply
