FROM php:7.1-fpm-alpine

MAINTAINER Saoneth <saoneth@gmail.com>

RUN mkdir -p /usr/local/var/run/php && \
  echo 'listen = /usr/local/var/run/php/www.sock' >> /usr/local/etc/php-fpm.d/zz-docker.conf
RUN docker-php-ext-install pdo pdo_mysql mysqli

RUN apk add --no-cache freetype libjpeg-turbo libpng && \
  apk add --no-cache --virtual=.build-dependencies freetype-dev libjpeg-turbo-dev  libpng-dev && \
  docker-php-ext-configure gd \
    --with-freetype-dir=/usr/include/ \
    --with-jpeg-dir=/usr/include/ \
    --with-png-dir=/usr/include/ && \
  docker-php-ext-install -j$(getconf _NPROCESSORS_ONLN) gd && \
  apk del --no-cache .build-dependencies
