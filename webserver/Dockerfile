# Dockerfile for simple python webserver
# Version 1.0
FROM docker-demo/python

MAINTAINER Lukas Pustina <lukas.pustina@centerdevice.com>

EXPOSE 8080

ADD webserver.py /opt/webserver/webserver.py
ADD run.sh /opt/webserver/run.sh

VOLUME ["/logs"]

