#!/bin/bash

VOLUME_HOME="/var/lib/mysql"

sed -ri -e "s/^upload_max_filesize.*/upload_max_filesize = ${PHP_UPLOAD_MAX_FILESIZE}/" \
    -e "s/^post_max_size.*/post_max_size = ${PHP_POST_MAX_SIZE}/" \
    /etc/php/7.0/apache2/php.ini

# Now we are going to bind to all interfaces for easy access.
# Do not do this on production a server unless MySQL is secured!
sed -ri -e "s/^bind-address.*/bind-address\t\t= 	0\.0\.0\.0/" \
    /etc/mysql/mysql.conf.d/mysqld.cnf

# Setup MySQL admin user.
if [[ ! -d $VOLUME_HOME/mysql ]]; then
    echo "=> An empty or uninitialized MySQL volume is detected in $VOLUME_HOME"
    echo "=> Installing MySQL ..."
    /usr/sbin/mysqld --initialize-insecure > /dev/null 2>&1
    echo "=> Done!"
    /setup-mysql-admin-user.sh
else
    echo "=> Using an existing volume of MySQL"
fi

exec supervisord -n
