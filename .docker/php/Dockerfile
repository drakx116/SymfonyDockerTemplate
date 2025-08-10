FROM dunglas/frankenphp:1-php8.4-alpine

RUN install-php-extensions xdebug

RUN apk add --no-cache git unzip

COPY --from=composer/composer:latest-bin /composer /usr/bin/composer

COPY . /app
