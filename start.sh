#!/bin/bash
exec echo "#!/bin/bash" > /data.sh
exec echo "service mysql start" >> data.sh
echo "#!/bin/bash" > /ser.sh
echo "apache2ctl -D FOREGROUND" >>ser.sh
sleep 1
chmod 755 /data.sh
chmod 755 /ser.sh
chmod +x /data.sh
chmod +x /ser.sh
echo "############ init user database ########################"
service mysql start
mysql -uroot -e "CREATE DATABASE IF NOT EXISTS  ${MYSQL_DATABASE} ;"
mysql -uroot -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY ${MYSQL_PASSWORD} ;"
mysql -uroot -e "GRANT ALL ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' WITH GRANT OPTION ; FLUSH PRIVILEGES;" 
sleep 1
service mysql stop
mysql_safe & apache2ctl -D FOREGROUND


