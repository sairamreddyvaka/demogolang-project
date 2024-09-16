#!/bin/bash
set -e #exits any errors

docker pull jenkins/jenkins:lts
docker volume create jenkins_data
docker run -d --name jenkins -p 8081:8080 -p 50000:50000 -v jenkins_data:/var/jenkins_home jenkins/jenkins:lts
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword