FROM php:7.3-apache

RUN apt-get update \
  && apt-get install -y zlib1g-dev libzip-dev mariadb-client libpng-dev libjpeg-dev libfreetype6-dev libwebp-dev msmtp \
  && docker-php-ext-install zip pdo_mysql mysqli \
  && apt-get autoremove -y \
  && apt-get clean -y

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-webp-dir=/usr/include/ --with-png-dir=/usr/include/
RUN docker-php-ext-install gd

# Composer install
COPY --from=composer /usr/bin/composer /usr/bin/composer
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /composer
ENV PATH $PATH:/composer/vendor/bin

WORKDIR /var/www

RUN a2enmod rewrite
