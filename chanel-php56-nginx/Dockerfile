FROM php:5.6-fpm
MAINTAINER Miles <miles@ifalo.com.tw>

ENV WWW_ROOT /var/www/html
ENV PUBLIC_ROOT /var/www/html/public
ENV NGINX_VERSION 1.9.9-1~jessie
ENV PHP_HOME /usr/local/etc/php

COPY entrypoint.sh /

RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 && \
    echo "deb http://nginx.org/packages/mainline/debian/ jessie nginx" >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y ca-certificates nginx=${NGINX_VERSION} gettext-base supervisor && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p ${WWW_ROOT} && mkdir -p ${PHP_HOME} && \
    chmod +x /entrypoint.sh

WORKDIR ${WWW_ROOT}

# Export nginx ports
EXPOSE 80 443

# Copy configurations
COPY php.ini ${PHP_HOME}/php.ini
COPY nginx /etc/nginx
COPY fpm /etc/php/fpm
COPY supervisord.conf /etc/supervisord.conf
COPY supervisor.d /etc/supervisor.d

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

# Install require extension
RUN apt-get update -y && apt-get install -y libmcrypt-dev libbz2-dev zlib1g-dev git && apt-get clean && rm -r /var/lib/apt/lists/*
RUN docker-php-ext-install bz2 mbstring mcrypt mysqli pdo_mysql zip

# Install Composer and tools
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer
RUN curl -L -O https://github.com/ApiGen/ApiGen.github.io/raw/master/apigen.phar; chmod +x apigen.phar; mv apigen.phar /usr/local/bin/apigen
RUN curl -L -O http://static.phpmd.org/php/latest/phpmd.phar; chmod +x phpmd.phar; mv phpmd.phar /usr/local/bin/phpmd

RUN apt-get update -y && apt-get install libmemcached-dev libssl-dev -y && apt-get clean && rm -r /var/lib/apt/lists/*
RUN pecl install mongo redis memcached && \
    echo "extension=mongo.so" > /usr/local/etc/php/conf.d/mongo.ini && \
    echo "extension=redis.so" > /usr/local/etc/php/conf.d/redis.ini && \
    echo "extension=memcached.so" > /usr/local/etc/php/conf.d/memcached.ini

# Token owner is Miles
RUN composer config -g github-oauth.github.com 18707af095f11b171a2fe46702ecdb495af8fc8c
