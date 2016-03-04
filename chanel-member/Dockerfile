FROM docker-repo.ifalo.com.tw/chanel-php56-nginx
MAINTAINER Miles <miles@ifalo.com.tw>

# Install composer packages
COPY ./chanel-member/composer.json .
COPY ./chanel-member/composer.lock .
COPY ./chanel-member/.env.example .
RUN composer install --optimize-autoloader

# Copy production code
COPY ./chanel-member/application ./application
COPY ./chanel-member/public ./public
COPY ./chanel-member/chanel .
