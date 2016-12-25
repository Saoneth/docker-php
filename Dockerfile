FROM php:7.1-fpm-alpine

MAINTAINER Saoneth <saoneth@gmail.com>

RUN docker-php-ext-install pdo pdo_mysql mysqli
RUN apk add --no-cache libpng-dev && \
  docker-php-ext-install gd
