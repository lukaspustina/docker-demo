# Dockerfile for simple python webserver
# Version 1.0
FROM lukaspustina/docker_demo_python

MAINTAINER Lukas Pustina <lukas.pustina@codecentric.de>

EXPOSE 8080

ADD webserver.py /opt/webserver/webserver.py
ADD run.sh /opt/webserver/run.sh

VOLUME ["/logs"]

