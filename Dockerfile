#
# Docker Image for Wikka 1.4.0 install.
#
# Usage
#   docker build -t wikka-1.4.0 .
#   docker run -d -p 5080:80 -p 5306:3306 wikka-1.4.0
#   docker ps
#   docker exec -it <CONTAINER ID> /bin/bash
#
# References
# - https://github.com/webmaestro365/lamp7xenial
# - https://github.com/pepitosoft/dockerWikkaDemo
#

#
# Base Build
#
FROM klenwell/klenwell-lamp:ubuntu-16.04
MAINTAINER Tom Atwell <klenwell@gmail.com>


#
# Application
#
# App Params
ENV WIKKAWIKI_VERSION "1.4.0-pre"
ENV MD5_CHECKSUM "N/A"
ENV WIKKA_MYSQL_DB "wikka"
ENV WIKKA_MYSQL_USER "wikka"
ENV WIKKA_MYSQL_PASS "wikka-password"

# Download and verify Wikka app.
RUN rm -fr /app
RUN mkdir -p /app/wikka
ADD https://github.com/wikkawik/WikkaWiki/archive/$WIKKAWIKI_VERSION.tar.gz \
    /app/wikka/$WIKKAWIKI_VERSION.tar.gz

# TODO: Verify Wikka source integrity.
# See http://docs.wikkawiki.org/WikkaSecurity#hn_Verifying_checksums
#WORKDIR /app/wikka
#RUN echo "$MD5_CHECKSUM $WIKKAWIKI_VERSION.tar.gz" | md5sum -c -

# Install Wikka
WORKDIR /app/wikka
RUN tar xzf "$WIKKAWIKI_VERSION.tar.gz" --strip 1
RUN rm "$WIKKAWIKI_VERSION.tar.gz"

# Configure Apache
ADD app/apache.conf /etc/apache2/sites-available/app.conf
RUN a2dissite 000-default
RUN a2ensite app
RUN chown -R www-data:www-data /var/www/html/wikka

# Configure App: Wikka
ADD app/supervisord.conf /etc/supervisor/conf.d/app-setup.conf
ADD app/setup.sh /app-setup.sh
RUN chmod 755 /app-setup.sh

#
# Container Interface
#
EXPOSE 80 3306
CMD ["/container.sh"]
