FROM golang:alpine
MAINTAINER Troy Kinsella

RUN apk add --no-cache \
  docker \
  git \
  make \
  nodejs \
  ruby
