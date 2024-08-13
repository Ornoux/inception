# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: npatron <npatron@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/07/27 17:32:40 by npatron           #+#    #+#              #
#    Updated: 2024/08/12 16:13:12 by npatron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN echo "WordPress CONTAINER : Installation of new packages..." && \
    apt-get update -y && apt-get upgrade -y && \
    echo "WordPress CONTAINER : Installation of wget and other packages..." && \
    apt-get install -y wget gettext-base php7.3 php-mysql php-fpm bash mariadb-client

RUN echo "WordPress CONTAINER : Downloading Cli..." && \
    mkdir -p /etc/conf/ && \
    mkdir -p /run/php && chown www-data:www-data /run/php && \
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv -f wp-cli.phar /usr/local/bin/wp

RUN echo "WordPress CONTAINER : Downloading Wordpress..." && \
    wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www && \
    cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz && \
    chown -R www-data:www-data /var/www/wordpress

COPY /conf/config_wp.sh /etc/conf/
COPY /conf/php.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN chmod +x /etc/conf/config_wp.sh

CMD ["sh", "/etc/conf/config_wp.sh"]


