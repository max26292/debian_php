#!/bin/bash
echo "/usr/bin/mysqld_safe --datadir='/var/lib/mysql" > /data.sh
echo "apache2ctl -D FOREGROUND" > /ser.sh
chmod 755 /data.sh
chmod 755 /ser.sh
service mysql start
mysql -uroot -e "CREATE DATABASE IF NOT EXISTS  ${MYSQL_DATABASE} ;"
mysql -uroot -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY ${MYSQL_PASSWORD} ;"
mysql -uroot -e "GRANT ALL ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@% WITH GRANT OPTION ; FLUSH PRIVILEGES;" 
service mysql stop
exec /data.sh & /ser.sh




