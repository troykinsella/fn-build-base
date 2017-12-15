FROM golang:latest
MAINTAINER Troy Kinsella

ADD https://archive.org/download/zeromq_4.1.4/zeromq-4.1.4.tar.gz /tmp/zeromq.tar.gz
ADD https://github.com/zeromq/goczmq/archive/v4.1.0.tar.gz /tmp/gczmq.tar.gz
ADD https://github.com/google/protobuf/releases/download/v3.4.0/protoc-3.4.0-linux-x86_64.zip /usr/local/

ENV PKG_CONFIG_PATH /usr/local/lib/pkgconfig

RUN apt-get -y update \
 && apt-get -y install \
      autoconf \
      automake \
      autotools-dev \
      build-essential \
      cmake \
      docker \
      file \
      git \
      libpcre3-dev \
      libsodium-dev \
      libtool \
      pkg-config \
      postgresql-client \
      unzip \
      uuid-dev \
      valgrind \
 \
 && cd /tmp \
 && tar xvzf zeromq.tar.gz \
 && cd zeromq-4.1.4 \
 && ./configure \
 && make -j7 \
 && make install \
 && echo "/usr/local/lib" > /etc/ld.so.conf.d/zmq.conf \
 && ldconfig \
 \
 && cd /tmp \
 && git clone git://github.com/zeromq/czmq.git\
 && cd czmq \
 && ./autogen.sh \
 && ./configure \
 && make install \
 && ldconfig \
 \
 && cd /usr/local \
 && unzip protoc-3.4.0-linux-x86_64.zip \
 && chmod +x bin/protoc \
 && ldconfig \
 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
