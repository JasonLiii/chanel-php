FROM docker-repo.ifalo.com.tw/chanel-php56-nginx
MAINTAINER Miles <miles@ifalo.com.tw>

# config phpfpm env setting
RUN sed -i 's/^;clear_env =/clear_env =/g' /etc/php5/fpm/pool.d/www.conf

# Install composer packages
COPY ./chanel-company/composer.json .
COPY ./chanel-company/composer.lock .
COPY ./chanel-company/.env.example .
RUN composer install --optimize-autoloader

# copy production code
COPY ./chanel-company/application ./application
COPY ./chanel-company/public ./public
COPY ./chanel-company/chanel .

# copy testing code
COPY ./chanel-company/tests ./tests
COPY ./chanel-company/codeception.yml ./codeception.yml

# copy php.ini
COPY ./conf/php.ini /etc/php5/fpm/php.ini
COPY ./conf/vhost.conf /opt/docker/etc/nginx/vhost.conf

# generate developer files
RUN apigen generate -s ./application/services -s ./application/dtos -s ./application/models -d ./public/docs/api
