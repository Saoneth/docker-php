FROM php:7.1-fpm-alpine

MAINTAINER Saoneth <saoneth@gmail.com>

RUN mkdir -p /usr/local/var/run/php && \
  echo 'listen = /usr/local/var/run/php/www.sock' >> /usr/local/etc/php-fpm.d/zz-docker.conf
RUN docker-php-ext-install pdo pdo_mysql mysqli
RUN apk add --no-cache freetype-dev libjpeg-turbo-dev libpng-dev && \
  docker-php-ext-install gd
