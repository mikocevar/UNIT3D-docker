FROM php:8.1-cli

RUN apt-get update && apt-get install -y supervisor libzip-dev \
    &&  docker-php-ext-configure zip \
    &&  docker-php-ext-install zip
RUN mkdir -p /var/log/supervisor

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN usermod -u 1000 www-data \
    && groupmod -g 1000 www-data

WORKDIR /var/www/html

RUN chown -R www-data:www-data .

CMD ["/usr/bin/supervisord"]