FROM php:5.6.30-apache
EXPOSE 80

RUN apt-get update; \
    apt-get install -y wget unzip; \
    docker-php-ext-install mysql; \
    apt-get install -y libfreetype6-dev libjpeg62-turbo-dev wget unzip; \
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/lib; \
    docker-php-ext-install gd

RUN touch /var/log/php-errors.log; \
    echo "date.timezone=Europe/Rome" >> /usr/local/etc/php/conf.d/docker-php.ini; \
    echo "display_errors = Off" >> /usr/local/etc/php/conf.d/docker-php.ini; \
    echo "log_errors = On" >> /usr/local/etc/php/conf.d/docker-php.ini; \
    echo "error_log = /dev/stdout" >> /usr/local/etc/php/conf.d/docker-php.ini;

ADD html /var/www/html
RUN chmod a-w include/config.inc.php && chmod 2777 /var/www/html/content -R
