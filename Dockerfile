FROM debian:jessie
MAINTAINER Erik Dasque <erik@frenchguys.com>

RUN apt-get update && apt-get install --no-install-recommends -y build-essential \
    gcc \
    unzip \
    wget \
    zip \
    gcc-avr \
    binutils-avr \
    avr-libc \
    dfu-programmer \
    dfu-util \
    gcc-arm-none-eabi \
    binutils-arm-none-eabi \
    libnewlib-arm-none-eabi \
    git \
    software-properties-common \
    avrdude \
    && rm -rf /var/lib/apt/lists/*

ENV keyboard=ergodox
ENV keymap=default
ENV target=

VOLUME /qmk
WORKDIR /qmk
CMD make clean ; make ${keyboard}:${keymap}:${target}
