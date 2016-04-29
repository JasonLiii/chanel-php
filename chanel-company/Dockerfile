FROM docker-repo.ifalo.com.tw/chanel-php56-nginx
MAINTAINER Miles <miles@ifalo.com.tw>

# Install composer packages
COPY ./chanel-company/composer.json .
COPY ./chanel-company/composer.lock .
COPY ./chanel-company/.env.example .
RUN composer install --no-dev --optimize-autoloader

# Copy production code
COPY ./chanel-company/application ./application
COPY ./chanel-company/public ./public
COPY ./chanel-company/chanel .
