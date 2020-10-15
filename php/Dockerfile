FROM php:7.3-apache

RUN apt-get update \
  && apt-get install -y zlib1g-dev libzip-dev mariadb-client libpng-dev libjpeg-dev libfreetype6-dev \
  && docker-php-ext-install zip pdo_mysql mysqli

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install gd

# Composer install
COPY --from=composer /usr/bin/composer /usr/bin/composer
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /composer
ENV PATH $PATH:/composer/vendor/bin

# mhsendmail
RUN curl -sSL https://github.com/mailhog/mhsendmail/releases/download/v0.2.0/mhsendmail_linux_amd64 -o mhsendmail \
    && chmod +x mhsendmail \
    && mv mhsendmail /usr/local/bin/mhsendmail

# Node install
# RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
# RUN apt-get install -y \
#     curl \
#     gnupg
# RUN apt-get install -y nodejs
# RUN npm install npm@latest -g

WORKDIR /var/www

RUN a2enmod rewrite
