mkdir jenkins_home
sudo docker run -it --rm -p 8080:8080 -p 50000:50000 -v ./jenkins_home:/var/jenkins_home jenkins/jenkins:lts