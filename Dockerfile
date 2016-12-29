#
# Docker LAMP Image
# - Linux   = Ubuntu 16.04
# - Apache  = Apache 2.4
# - MySQL   = MySQL 5.7
# - PHP     = PHP 7.0
#
# Usage
#   docker build -t klenwell-lamp .
#   docker run -d -p 5080:80 -p 5306:3306 klenwell-lamp
#   docker ps
#   docker exec -it <CONTAINER ID> /bin/bash
#
# References
# - https://github.com/webmaestro365/lamp7xenial
# - http://odino.org/spring-cleaning-of-your-docker-containers/
#
FROM ubuntu:16.04
MAINTAINER Tom Atwell <klenwell@gmail.com>

#
# Linux
#
RUN apt-get -y update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
    supervisor \
    git \
    vim \
    apache2 \
    mysql-server \
    php7.0 \
    php-apcu \
    php7.0-mcrypt \
    php7.0-mysql \
    php7.0-gd \
    php7.0-mbstring \
    php7.0-curl \
    libapache2-mod-php7.0 \
    pwgen

#
# Apache
#
ADD conf/supervisord/apache2.conf /etc/supervisor/conf.d/apache2.conf

# config to enable .htaccess
ADD conf/apache2/000-default.conf /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite
RUN chown -R www-data:www-data /var/www

#
# MySQL
# setup-mysql-admin-user.sh will be called by container.sh
#
ADD conf/supervisord/mysqld.conf /etc/supervisor/conf.d/mysqld.conf
ADD setup/mysql-admin-user.sh /setup-mysql-admin-user.sh
RUN chmod 755 /setup-mysql-admin-user.sh

# Remove pre-installed database
RUN rm -rf /var/lib/mysql/*

# Add volumes for MySQL
VOLUME  ["/etc/mysql", "/var/lib/mysql"]

#
# PHP
#
ENV PHP_UPLOAD_MAX_FILESIZE 10M
ENV PHP_POST_MAX_SIZE 10M

#
# Application
#
RUN mv /var/www/html/index.html /var/www/html/ubuntu.html
ADD app/index.php /var/www/html/index.php
ADD app/favicon.ico /var/www/html/favicon.ico

#
# Container Interface
#
ADD container.sh /container.sh
RUN chmod 755 /container.sh
EXPOSE 80 3306
CMD ["/container.sh"]
