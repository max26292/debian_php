#!/bin/bash

mysql -uroot -e "CREATE DATABASE IF NOT EXISTS  ${MYSQL_DATABASE} ;"
mysql -uroot -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY ${MYSQL_PASSWORD} ;"
mysql -uroot -e "GRANT ALL ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@% WITH GRANT OPTION ; FLUSH PRIVILEGES;" 
chmod 755 /init_database.sh
chmod 775 /var/run/mysqld
/init_database.sh




