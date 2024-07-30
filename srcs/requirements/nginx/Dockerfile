# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: npatron <npatron@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/07/27 17:32:40 by npatron           #+#    #+#              #
#    Updated: 2024/07/29 15:32:45 by npatron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	debian:buster

RUN		echo "NGINX CONTAINER: I am installing nginx and openssl" && \
		apt-get update && apt-get install nginx -y &&  \
		apt-get install openssl && \
		mkdir -p /etc/nginx/ssl && \
		mkdir -p /var/run/nginx
		
RUN		echo "NGINX CONTAINER: Creation of your certificate SSL to /etc/nginx/ssl/inception.crt" && \
		openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=Alpes-Maritimes/L=Nice/O=42/OU=42/CN=login.42.fr/UID=login"

RUN		chmod 755 /var/www/html
RUN 	chown -R www-data:www-data /var/www/html
     
COPY	conf/nginx.conf /etc/nginx/nginx.conf

CMD 	[ "nginx", "-g", "daemon off;" ]
