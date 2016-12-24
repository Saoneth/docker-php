FROM php:7.1-fpm-alpine

MAINTAINER Saoneth <saoneth@gmail.com>

RUN docker-php-ext-install mysqli
RUN docker-php-ext-install gd
RUN docker-php-ext-install memcached 
