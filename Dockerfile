FROM ubuntu:16.04
ENV DEBIAN_FRONTEND noninteractive

RUN apt update
RUN apt install wget -y

RUN wget https://download.foldingathome.org/releases/public/release/fahclient/debian-stable-64bit/v7.5/fahclient_7.5.1_amd64.deb
RUN dpkg -i --force-depends fahclient_7.5.1_amd64.deb

ADD config.xml /etc/fahclient/config.xml
ADD entrypoint.sh /etc/fahclient/entrypoint.sh

WORKDIR /var/lib/fahclient
CMD	["/etc/fahclient/entrypoint.sh"]
