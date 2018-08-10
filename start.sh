#!/bin/bash
__run() {
    /data.sh && /ser.sh
}
echo "############ init user database ########################"
service mysql start
mysql -uroot -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE} ;"
echo mysql -uroot -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}' ;"
mysql -uroot -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}' ;"
echo mysql -uroot -e "GRANT ALL ON PRIVILEGES ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' WITH GRANT OPTION ; FLUSH PRIVILEGES;" 
mysql -uroot -e "GRANT ALL ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' WITH GRANT OPTION ; FLUSH PRIVILEGES;" 
sleep 1
service mysql stop
__run


