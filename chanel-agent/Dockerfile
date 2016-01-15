FROM docker-repo.ifalo.com.tw/chanel-php56-nginx
MAINTAINER Miles <miles@ifalo.com.tw>

# config phpfpm env setting
RUN sed -i 's/^;clear_env =/clear_env =/g' /etc/php5/fpm/pool.d/www.conf

# Install composer packages
COPY ./chanel-agent/composer.json .
COPY ./chanel-agent/composer.lock .
COPY ./chanel-agent/.env.example .
RUN composer install --optimize-autoloader

# copy production code
COPY ./chanel-agent/application ./application
COPY ./chanel-agent/public ./public
COPY ./chanel-agent/chanel .

# copy testing code
COPY ./chanel-agent/tests ./tests
COPY ./chanel-agent/codeception.yml ./codeception.yml

# copy php.ini
COPY ./conf/php.ini /etc/php5/fpm/php.ini
COPY ./conf/vhost.conf /opt/docker/etc/nginx/vhost.conf
