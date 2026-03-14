FROM dunglas/frankenphp:1-php8.5-trixie

RUN install-php-extensions xdebug

RUN apt update &&  \
    apt install -y --no-install-recommends git unzip zip  &&  \
    rm -rf /var/lib/apt/lists/*

COPY --from=composer/composer:latest-bin /composer /usr/bin/composer

COPY . /app
