FROM golang:latest
MAINTAINER Troy Kinsella

RUN apt-get -y update \
 && apt-get -y install \
      build-essential \
      docker \
      git \
      nodejs-legacy \
      ruby
