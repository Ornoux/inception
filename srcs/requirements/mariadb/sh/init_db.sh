#!/bin/bash
# 

# mkdir -p /etc/sh/myErrorFile
# myErrorFile="/etc/sh/myErrorFile/error.log"
# mkdir -p /etc/sh/mySuccessFile
# mySuccessFile="/etc/sh/mySuccessFile/success.log"

# touch "$myErrorFile"
# touch "$mySuccessFile"

# chmod 664 "$myErrorFile"
# chmod 664 "$mySuccessFile"

# if [ -z "$MYSQL_DATABASE" ]; then
#     mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
#     echo "Initialization of $MYSQL_DATABASE..." >> "$mySuccessFile"

#     if [ -z "$MYSQL_PASSWORD" ]; then
#         mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_DATABASE}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
#         echo "Giving privileges on $MYSQL_DATABASE to $MYSQL_DATABASE..." >> "$mySuccessFile"
#     else
#         echo "'MYSQL_PASSWORD' variable is empty" >> "$myErrorFile"
#     fi
# else
#     echo "'MYSQL_DATABASE' variable is empty" >> "$myErrorFile"
# fi

# if [ -z "$MYSQL_ROOT_PASSWORD" ]; then
#     mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
#     mysql -e "FLUSH PRIVILEGES;"
#     mysqladmin -u root -p"$MYSQL_ROOT_PASSWORD" shutdown
# else
#     echo "'MYSQL_ROOT_PASSWORD' variable is empty" >> "$myErrorFile"
# fi

service mysql start
mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"

pkill mysqld
/usr/bin/mysqld --user=root --datadir=/var/lib/mysql

# # mysqladmin -u root -p"$MYSQL_ROOT_PASSWORD" shutdown
# exec mysqld_safe

