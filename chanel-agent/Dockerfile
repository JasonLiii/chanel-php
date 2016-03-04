FROM docker-repo.ifalo.com.tw/chanel-php56-nginx
MAINTAINER Miles <miles@ifalo.com.tw>

# Install composer packages
COPY ./chanel-agent/composer.json .
COPY ./chanel-agent/composer.lock .
COPY ./chanel-agent/.env.example .
RUN composer install --optimize-autoloader

# Copy production code
COPY ./chanel-agent/application ./application
COPY ./chanel-agent/public ./public
COPY ./chanel-agent/chanel .
