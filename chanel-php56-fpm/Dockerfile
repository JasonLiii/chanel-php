FROM webdevops/php-nginx:debian-8

# Install require extension
RUN apt-get update -y && apt-get install -y vim curl git php5-mcrypt php5-memcached php5-mongo php5-mysqlnd php5-redis php5-xdebug && apt-get clean

# Enable mod
RUN rm /etc/php5/fpm/conf.d/20-mcrypt.ini /etc/php5/cli/conf.d/20-mcrypt.ini && php5enmod mcrypt
#RUN cd /etc/php5/fpm/conf.d && ln -s /etc/php5/mods-available/mcrypt.ini 20-mcrypt.ini

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

# Initial
ENV WEB_DOCUMENT_ROOT  /application/code/public/
ENV WEB_DOCUMENT_INDEX index.php

RUN mkdir -p /application/code
WORKDIR /application/code

# Token owner is Miles
RUN composer config -g github-oauth.github.com a7a0f5738bc42ebe5c1dc749277033901fe4a861
