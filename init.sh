#!/bin/bash
####### Config for apache 2 host
SERVER_NAME_FILE=/etc/apache2/conf-available/servername.conf
if [ ! -f "$SERVER_NAME_FILE" ]; then
   echo "ServerName localhost" > $SERVER_NAME_FILE 
   a2enconf servername
fi
###### Config mysql 
chmod 775 /var/run/mysqld
chmod 777 /var/lib/mysql
service mysql start
mysql -uroot -e "CREATE USER 'root'@'%';"
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION ; FLUSH PRIVILEGES; "
echo "#!/bin/bash" >/init_database.sh
echo 'mysql -uroot -e "CREATE DATABASE IF NOT EXISTS  ${MYSQL_DATABASE} ;"' >>/init_database.sh
echo 'mysql -uroot -e "CREATE USER IF NOT EXISTS ${MYSQL_USER@% IDENTIFIED BY ${MYSQL_PASSWORD} ;"' >>/init_database.sh
echo 'mysql -uroot -e "GRANT ALL ON ${MYSQL_DATABASE}.* TO ${MYSQL_USER}@% WITH GRANT OPTION ; FLUSH PRIVILEGES;" '>>/init_database.sh
chmod 755 /init_database.sh
/init_database.sh
service mysql stop