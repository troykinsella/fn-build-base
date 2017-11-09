FROM golang:latest
MAINTAINER Troy Kinsella

ADD https://archive.org/download/zeromq_4.1.4/zeromq-4.1.4.tar.gz /tmp/
ADD https://github.com/google/protobuf/releases/download/v3.4.0/protoc-3.4.0-linux-x86_64.zip /usr/local/

ENV PKG_CONFIG_PATH /usr/local/lib/pkgconfig

RUN apt-get -y update \
 && apt-get -y install \
      build-essential \
      docker \
      file \
      git \
      libsodium-dev \
      postgresql-client \
      unzip \
 && cd /tmp \
 && tar xvzf zeromq-4.1.4.tar.gz \
 && cd zeromq-4.1.4 \
 && ./configure \
 && make -j7 \
 && make install \
 && echo "/usr/local/lib" > /etc/ld.so.conf.d/zmq.conf \
 && cd /usr/local \
 && unzip protoc-3.4.0-linux-x86_64.zip \
 && chmod +x bin/protoc \
 && ldconfig \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
