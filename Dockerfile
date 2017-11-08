FROM golang:latest
MAINTAINER Troy Kinsella

ADD https://archive.org/download/zeromq_4.1.4/zeromq-4.1.4.tar.gz /tmp/

RUN apt-get -y update \
 && apt-get -y install \
      build-essential \
      docker \
      file \
      git \
      libsodium-dev \
      postgresql-client \
 && cd /tmp \
 && tar xvzf zeromq-4.1.4.tar.gz \
 && cd zeromq-4.1.4 \
 && ./configure \
 && make -j7 \
 && make install \
 && echo "/usr/local/lib" > /etc/ld.so.conf.d/zmq.conf \
 && ldconfig \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \

ENV PKG_CONFIG_PATH /usr/local/lib/pkgconfig
