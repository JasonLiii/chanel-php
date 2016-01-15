FROM docker-repo.ifalo.com.tw/chanel-php56-nginx
MAINTAINER Miles <miles@ifalo.com.tw>

# config phpfpm env setting
RUN sed -i 's/^;clear_env =/clear_env =/g' /etc/php5/fpm/pool.d/www.conf

# Install composer packages
COPY ./chanel-member/composer.json .
COPY ./chanel-member/composer.lock .
COPY ./chanel-member/.env.example .
RUN composer install --optimize-autoloader

# copy production code
COPY ./chanel-member/application ./application
COPY ./chanel-member/public ./public
COPY ./chanel-member/chanel .

# copy testing code
COPY ./chanel-member/tests ./tests
COPY ./chanel-member/codeception.yml ./codeception.yml

# copy php.ini
COPY ./conf/php.ini /etc/php5/fpm/php.ini
COPY ./conf/vhost.conf /opt/docker/etc/nginx/vhost.conf
