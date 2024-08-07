# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: npatron <npatron@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/07/27 17:32:40 by npatron           #+#    #+#              #
#    Updated: 2024/08/07 15:16:23 by npatron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN echo "WordPress CONTAINER : Installation of new packages..."
RUN apt-get update -y && apt-get upgrade -y

RUN echo "WordPress CONTAINER : Installation of wget..."
RUN apt-get install wget -y

RUN echo "WordPress CONTAINER : Installating php..."
RUN apt-get install -y \
    php7.3 \
    php-fpm \
    php-mysql \
    mariadb-client

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz \ 
    && rm wordpress-6.0-fr_FR.tar.gz

RUN mkdir -p /var/www/wordpress
RUN	chown -R root:root /var/www/wordpress
RUN mkdir -p /etc/conf/

COPY /conf/config_wp.sh /etc/conf/
RUN chmod +x /etc/conf/config_wp.sh
RUN /bin/bash /etc/conf/config_wp.sh

