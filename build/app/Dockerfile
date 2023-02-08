FROM valarmorghuliis/php:8.2.2-fpm-alpine3.17

MAINTAINER vladamir

ARG API_VERSION
ENV API_VERSION=$API_VERSION

# php
ADD build/app/php.ini /usr/local/etc/php/php.ini
ADD build/app/opcache.ini /usr/local/etc/php/conf.d/opcache.ini

# php-fpm
ADD build/app/php-fpm.conf /usr/local/etc/php-fpm.conf
ADD build/app/www.conf /usr/local/etc/php-fpm.d/www.conf

# nginx
ADD build/app/nginx.conf /etc/nginx/
ADD build/app/conf.d/default.conf /etc/nginx/conf.d/

# supervisor
ADD build/app/supervisord.conf /etc/supervisord.conf

#cron
RUN echo '*  *  *  *  * /usr/local/bin/php /var/www/artisan schedule:run >> /dev/null 2>&1' > /etc/crontabs/root

COPY . /var/www

RUN apk update \
    && apk add --no-cache bash \
    && chown -R www-data:www-data /var/lib/nginx

WORKDIR /var/www

COPY ./build/app/entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

EXPOSE 80 443

ENTRYPOINT ["/entrypoint.sh"]
