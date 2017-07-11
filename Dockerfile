FROM golang:alpine
MAINTAINER Troy Kinsella

RUN apk add --no-cache \
  ca-certificates \
  build-base \
  docker \
  git \
  nodejs \
  ruby \
  openssh-client \
  openssl
