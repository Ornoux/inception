#!/bin/bash
# 


service mysql start

if [ -n "$DB_NAME" ]; then
	mysql -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"
    echo "Initialisation of $DB_NAME..."
	if [ -n "$DB_USER" ] && [ -n "$DB_PASSWORD" ]; then
		echo "Registration of one USER into the DB..."
		mysql -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'localhost' IDENTIFIED BY '${DB_PASSWORD}';"
		echo "Giving MariaDB's privileges to ${DB_USER}"
		mysql -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';"
    fi
fi

if [ -n "$DB_ROOT_PASSWORD" ]; then
    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';"
	echo "Refreshing new settings..."
    mysql -p"$DB_ROOT_PASSWORD" -e "FLUSH PRIVILEGES;"
	echo "Restart of MySQL, changes will take effect..."
    mysqladmin -u root -p"$DB_ROOT_PASSWORD" shutdown
fi

exec mysqld_safe

