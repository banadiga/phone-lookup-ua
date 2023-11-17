FROM composer as builder
WORKDIR /app/
COPY composer.* ./
RUN composer install

FROM php:8.0.3-apache-buster
COPY --from=builder /app/vendor /var/www/vendor

RUN apt-get update && apt-get install apt-file -y && apt-file update && apt-get install vim wget libzip-dev zip -y

# Add configuration
ADD config/mods-available /etc/apache2/mods-available/

# Add script to run
ADD docker-php-apache-start /usr/local/bin/

ADD classes /var/www/html/classes
ADD index.php /var/www/html/

CMD ["docker-php-apache-start"]
