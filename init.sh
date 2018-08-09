#!/bin/bash
####### Config for apache 2 host
SERVER_NAME_FILE=/etc/apache2/conf-available/servername.conf
if [ ! -f "$SERVER_NAME_FILE" ]; then
   echo "ServerName localhost" > $SERVER_NAME_FILE 
   a2enconf servername
fi
###### Config mysql 
### create my.conf
echo "[mysqld]" >> /etc/my.cnf
echo "port=3306" >> /etc/my.cnf
echo "socket=/var/run/mysqld/mysqld.sock" >> /etc/my.cnf
echo "datadir=/var/lib/mysql" >>/etc/my.cnf
echo "[client]" >> /etc/my.cnf
echo "port=3306" >> /etc/my.cnf
echo "socket=/var/run/mysqld/mysqld.sock" >> /etc/my.cnf
echo "[mysql]" >> /etc/my.cnf
echo "no-auto-rehash" >> /etc/my.cnf
echo "[myisamchk]" >> /etc/my.cnf
echo "set-variable= key_buffer=128M" >> /etc/my.cnf
service mysql start
chmod 775 /var/run/mysqld
chmod 777 /var/lib/mysql
mysql -uroot -e "CREATE USER 'root'@'%';"
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION ; FLUSH PRIVILEGES; "
chmod 755 /init_database.sh
/init_database.sh
service mysql stop