#!/bin/bash
# Runtime configuration steps for Wikka.

#
# Setup Wikka mysql user and database.
#
# Start mysql.
/usr/bin/mysqld_safe > /dev/null 2>&1 &
RET=1
while [[ RET -ne 0 ]]; do
    echo "=> Waiting for confirmation of MySQL service startup"
    sleep 5
    mysql -uroot -e "status" > /dev/null 2>&1
    RET=$?
done

# Create database and user.
# Vars set as ENV vars in Dockerfile.
mysql -uroot -e "CREATE DATABASE IF NOT EXISTS $WIKKA_MYSQL_DB;"
mysql -uroot -e "GRANT ALL PRIVILEGES ON $WIKKA_MYSQL_DB.* TO '$WIKKA_MYSQL_USER'@'localhost' IDENTIFIED BY '$WIKKA_MYSQL_PASS';"
mysql -uroot -e "FLUSH PRIVILEGES;"
