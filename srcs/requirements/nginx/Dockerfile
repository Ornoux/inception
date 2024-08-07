# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: npatron <npatron@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/07/27 17:32:40 by npatron           #+#    #+#              #
#    Updated: 2024/08/07 15:45:11 by npatron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	debian:buster

RUN		echo "NGINX CONTAINER: Installation of nginx + openssl"
RUN		apt-get update;
RUN 	apt-get install nginx -y;
RUN 	apt-get install openssl;
RUN 	mkdir -p /etc/nginx/ssl && \
		mkdir -p /var/run/nginx
		
RUN		echo "NGINX CONTAINER: Creation of your certificate SSL to /etc/nginx/ssl/inception.crt" && \
		openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=Alpes-Maritimes/L=Nice/O=42/OU=42/CN=npatron.42.fr/UID=login"


RUN		chmod 755 /var/www/html

RUN		mv /var/www/html/index.nginx-debian.html /var/www/html/index_de_base_nginx.html
RUN 	chown -R www-data:www-data /var/www/html

COPY	html/page.html /var/www/html/page.html
COPY	conf/nginx.conf /etc/nginx/nginx.conf

CMD 	[ "nginx", "-g", "daemon off;" ]
