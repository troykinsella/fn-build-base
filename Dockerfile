FROM golang:alpine
MAINTAINER Troy Kinsella

RUN apk add --no-cache \
  ca-certificates \
  docker \
  git \
  make \
  nodejs \
  ruby \
  openssh-client \
  openssl

