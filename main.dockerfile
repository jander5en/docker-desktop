#Build with tag kubuntudesktop_main : "docker build -t kubuntudesktop_main -f main.dockerfile"

FROM ubuntu:latest

RUN apt update && \
DEBIAN_FRONTEND=noninteractive apt install -y kubuntu-desktop xrdp remmina && \
adduser xrdp ssl-cert
