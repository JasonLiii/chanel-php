FROM php:5.6-apache

# Install require extension
RUN apt-get update -y && apt-get install -y libmcrypt-dev libbz2-dev zlib1g-dev git && apt-get clean && rm -r /var/lib/apt/lists/*
RUN docker-php-ext-install bz2 mbstring mcrypt mysqli pdo_mysql zip

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

RUN apt-get update -y && apt-get install libmemcached-dev libssl-dev -y && apt-get clean && rm -r /var/lib/apt/lists/*
RUN pecl install mongo redis memcached && \
    echo "extension=mongo.so" > /usr/local/etc/php/conf.d/mongo.ini && \
    echo "extension=redis.so" > /usr/local/etc/php/conf.d/redis.ini && \
    echo "extension=memcached.so" > /usr/local/etc/php/conf.d/memcached.ini

# Token owner is Miles
RUN composer config -g github-oauth.github.com a7a0f5738bc42ebe5c1dc749277033901fe4a861
