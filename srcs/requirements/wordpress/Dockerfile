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

RUN mkdir -p /etc/conf/
RUN echo "WordPress CONTAINER : Using of wget to download WordPress"
RUN wget  https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www

RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz \ 
    && rm wordpress-6.0-fr_FR.tar.gz

RUN echo "WordPress CONTAINER : Modifying PHP config file..."

RUN echo "clear_env = no" >> /etc/php/7.3/fpm/pool.d/www.conf
RUN sed -i 's#listen = /run/php/php7.3-fpm.sock#listen=wordpress:9000#' /etc/php/7.3/fpm/pool.d/www.conf

RUN	chown -R root:root /var/www/wordpress

RUN echo "WordPress CONTAINER : Installing CLI..."
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
COPY /conf/config_wp.sh /etc/conf/config_wp.sh
RUN chmod 777 /etc/conf/config_wp.sh

ENTRYPOINT ["/etc/conf/config_wp.sh"]


