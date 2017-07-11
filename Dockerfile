FROM ubuntu:latest
MAINTAINER Troy Kinsella

RUN apt-get -y update \
 && apt-get -y install \
      build-essential \
      git \
      nodejs-legacy \
      ruby

