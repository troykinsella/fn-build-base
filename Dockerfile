FROM ubuntu:latest
MAINTAINER Troy Kinsella

RUN apt-get -y update \
 && apt-get -y install \
      git \
      nodejs-legacy \
      ruby

