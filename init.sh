#!/bin/bash
####### Config for apache 2 host
SERVER_NAME_FILE=/etc/apache2/conf-available/servername.conf
if [ ! -f "$SERVER_NAME_FILE" ]; then
   echo "ServerName localhost" > $SERVER_NAME_FILE 
   a2enconf servername
fi
###### Config mysql 
### create my.conf
echo "# The MariaDB configuration file" >/etc/mysql/my.cnf
echo "!includedir /etc/mysql/conf.d/" >>/etc/mysql/mycnf
echo "!includedir /etc/mysql/mariadb.conf.d/" >>/etc/mysql/mycnf
echo "[mysqld]" >> /etc/mysql/my.cnf
echo "port=3306" >> /etc/mysql/my.cnf
echo "socket=/var/run/mysqld/mysqld.sock" >> /etc/mysql/my.cnf
echo "datadir=/var/lib/mysql" >>/etc/mysql/my.cnf
echo "[client]" >> /etc/mysql/my.cnf
echo "port=3306" >> /etc/mysql/my.cnf
echo "socket=/var/run/mysqld/mysqld.sock" >> /etc/mysql/my.cnf
echo "[mysql]" >> /etc/mysql/my.cnf
echo "no-auto-rehash" >> /etc/mysql/my.cnf
echo "[myisamchk]" >> /etc/mysql/my.cnf
echo "set-variable= key_buffer=128M" >> /etc/mysql/my.cnf
mysql_install_db
service mysql stop
chmod 755 /var/run
chmod 777 /var/lib/mysql
service mysql start
mysql -uroot -e "CREATE USER 'root'@'%';"
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION ; FLUSH PRIVILEGES; "
service mysql stop