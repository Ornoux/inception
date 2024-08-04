#!/bin/bash
sleep 10
wp config create	--allow-root \
                    --dbname=$MYSQL_DATABASE \
                    --dbuser=$MYSQL_USER \
                    --dbpass=$MYSQL_PASSWORD \
                    --dbhost=mariadb:3306 --path='/var/www/wordpress'

wp core install --url="https://$MYSERVER_NAME" --title="Le site du SIECLE" \
                --admin_user="NICOLAS PATRON" --admin_password="mypassword" \
                --admin_email="nicolas.patron@hotmail.fr"

wp user create  ornoux ornaxgame@gmail.com --role=user --user_pass=pass \
                --first_name="Ornax" --last_name="Valorant" --display_name="LeBgDu06"
                