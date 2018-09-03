#!/bin/bash
####### Config for apache 2 host
SERVER_NAME_FILE=/etc/apache2/conf-available/servername.conf
if [ ! -f "$SERVER_NAME_FILE" ]; then
   echo "ServerName localhost" > $SERVER_NAME_FILE
   a2enconf servername
fi
a2enmod rewrite
service apache2 start
service apache2 reload
service apache2 stop
###### Config mysql
# ### create my.conf
# echo "# The MariaDB configuration file" >/etc/mysql/my.cnf
# echo "!includedir /etc/mysql/conf.d/" >>/etc/mysql/mycnf
# echo "!includedir /etc/mysql/mariadb.conf.d/" >>/etc/mysql/mycnf
# echo "[mysqld]" >> /etc/mysql/my.cnf
# echo "port=3306" >> /etc/mysql/my.cnf
# echo "socket=/var/run/mysqld/mysqld.sock" >> /etc/mysql/my.cnf
# echo "bind-address=0.0.0.0" >> /etc/mysql/my.cnf
# echo "[client]" >> /etc/mysql/my.cnf
# echo "port=3306" >> /etc/mysql/my.cnf
# echo "socket=/var/run/mysqld/mysqld.sock" >> /etc/mysql/my.cnf
# echo "[mysql]" >> /etc/mysql/my.cnf
# echo "no-auto-rehash" >> /etc/mysql/my.cnf
# # echo "[myisamchk]" >> /etc/mysql/my.cnf
# chmod 755 /var/run
# chmod 777 /var/lib/mysql
# mkdir /usr/local/bin/mysql
# chown -R mysql /var/lib/mysql
# chown -R mysql /var/run/mysqld
# chgrp -R mysql /var/lib/mysql
# chmod 777 /usr/local/bin/mysql
# chown -R mysql /usr/local/bin/mysql
# echo "########### Finish initial database ###################"
# service mysql start
# mysql -uroot -proot -e "CREATE USER 'root'@'%';"
# mysql -uroot -proot -e "CREATE USER 'root'@'::1';"
# mysql -uroot -proot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION ; FLUSH PRIVILEGES; "
# sleep 1
# service mysql stop
# ##init start file
# echo "#!/bin/bash" > /data.sh
# echo "service mysql start" >> /data.sh
echo "#!/bin/bash" > /ser.sh
echo "apache2ctl -D FOREGROUND" >> /ser.sh
sleep 1
# chmod 755 /data.sh
chmod 755 /ser.sh
# chmod +x /data.sh
chmod +x /ser.sh
