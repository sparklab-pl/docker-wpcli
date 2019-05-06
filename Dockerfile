FROM php:7.3-fpm-alpine

RUN docker-php-ext-install -j$(nproc) mysqli \
    && apk add --no-cache curl less mysql-client \
    && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

RUN adduser -D app

USER app
WORKDIR /app
