FROM php:5.6-fpm
MAINTAINER Miles <miles@ifalo.com.tw>

ENV WWW_ROOT /var/www/html
ENV PUBLIC_ROOT /var/www/html/public
ENV NGINX_VERSION 1.9.15-1~jessie
ENV PHP_HOME /usr/local/etc/php

COPY entrypoint.sh /

RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 && \
    echo "deb http://nginx.org/packages/mainline/debian/ jessie nginx" >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install --no-install-recommends --no-install-suggests -y \
						ca-certificates \
						gettext-base \
            git \
            libbz2-dev \
            libfreetype6-dev \
            libjpeg62-turbo-dev \
            libmcrypt-dev \
            libmemcached-dev \
            libpng12-dev \
            libssl-dev \
						nginx=${NGINX_VERSION} \
						nginx-module-xslt \
						nginx-module-geoip \
						nginx-module-image-filter \
						nginx-module-perl \
						nginx-module-njs \
            supervisor \
            zlib1g-dev \
    && rm -rf /var/lib/apt/lists/* && \
    mkdir -p ${WWW_ROOT} && mkdir -p ${PHP_HOME} && \
    chmod +x /entrypoint.sh

# Install require extension
RUN docker-php-ext-install bcmath bz2 mbstring mcrypt mysqli pdo_mysql zip

RUN pecl install mongo redis memcached && \
    echo "extension=mongo.so" > /usr/local/etc/php/conf.d/mongo.ini && \
    echo "extension=redis.so" > /usr/local/etc/php/conf.d/redis.ini && \
    echo "extension=memcached.so" > /usr/local/etc/php/conf.d/memcached.ini

#Install gd
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

WORKDIR ${WWW_ROOT}

# Install Composer and tools
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

# Token owner is Miles
RUN composer config -g github-oauth.github.com 18707af095f11b171a2fe46702ecdb495af8fc8c

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
