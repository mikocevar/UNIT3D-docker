FROM php:8.1-fpm

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN apt-get clean
RUN apt-get update && apt-get install -y \
        zlib1g-dev libicu-dev g++ \
        libjpeg62-turbo-dev \
        libzip-dev \
        libpng-dev \
        libwebp-dev \
        libfreetype6-dev \
    	libxml2-dev \
        apt-utils \
    	git \
    	zip \
        vim \
    	unzip \ 
        default-mysql-client \
        redis-tools \
        cron \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-configure gd --with-webp=/usr/include/webp --with-jpeg=/usr/include --with-freetype=/usr/include/freetype2/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install -j$(nproc) zip \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl \
    && docker-php-ext-configure opcache \
    && docker-php-ext-install opcache \
    && docker-php-ext-configure bcmath \
    && docker-php-ext-install bcmath 

RUN pecl install -o -f redis \
    && rm -rf /tmp/pear \ 
    && docker-php-ext-enable redis

RUN usermod -u 1000 www-data \
    && groupmod -g 1000 www-data

RUN chown -R www-data:www-data .

RUN echo "* * * * * php var/www/html/artisan schedule:run >> /dev/null 2>&1" | crontab -

# RUN pecl install xdebug \
#     && docker-php-ext-enable xdebug

# 'npm install',
#  npm install -g laravel-echo-server
# 'npx mix -p',
# 'php artisan key:generate',
# 'php artisan migrate --seed',
# 'composer install -q',
# 'npm install',
# 'npx mix -p',
# 'php artisan key:generate',
# 'php artisan migrate --seed',
# laravel-echo-server.json -> laravel-echo-server client:add
# 