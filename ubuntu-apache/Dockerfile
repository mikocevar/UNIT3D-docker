FROM ubuntu/apache2:latest

RUN apt-get clean
RUN apt-get update && apt-get install -y \
        apt-utils \
    	git \
    	zip \
        vim \
    	unzip \
        curl \
        iputils-ping \
        telnet \
        libapache2-mod-fcgid \
        npm \
        cron

RUN a2enmod rewrite
RUN a2enmod expires

ADD ./000-default.conf /etc/apache2/sites-enabled/000-default.conf
ADD ./unit3d.conf /etc/supervisor/conf.d/unit3d.conf

RUN a2enmod actions proxy_fcgi

RUN usermod -u 1000 www-data \
 && groupmod -g 1000 www-data

WORKDIR /var/www/html