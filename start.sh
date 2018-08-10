#!/bin/bash
__run{
    /data.sh && /ser.sh
}
echo "############ init user database ########################"
exec service mysql start
exec mysql -uroot -e "CREATE DATABASE IF NOT EXISTS  ${MYSQL_DATABASE} ;"
exec mysql -uroot -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY ${MYSQL_PASSWORD} ;"
exec mysql -uroot -e "GRANT ALL ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' WITH GRANT OPTION ; FLUSH PRIVILEGES;" 
sleep 1
exec service mysql stop



