FROM golang:alpine
MAINTAINER Troy Kinsella

RUN apk add --no-cache \
  ca-certificates \
  docker \
  gcc \
  git \
  make \
  nodejs \
  ruby \
  openssh-client \
  openssl

