FROM ubuntu:latest
MAINTAINER Troy Kinsella

RUN apt-get -y update \
 && apt-get -y install \
      ruby \
      nodejs-legacy
