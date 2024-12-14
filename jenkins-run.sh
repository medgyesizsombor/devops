#!/bin/bash
# -d, hogy a háttérben fusson
sudo docker run -d -p 8080:8080 -p 50000:50000 -v ./jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock my-jenkins

exec "$@"