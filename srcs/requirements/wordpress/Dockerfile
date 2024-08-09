# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: npatron <npatron@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/07/27 17:32:40 by npatron           #+#    #+#              #
#    Updated: 2024/08/09 19:55:21 by npatron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN echo "WordPress CONTAINER : Installation of new packages..." && \
    apt-get update -y && apt-get upgrade -y && \
    echo "WordPress CONTAINER : Installation of wget..." && \
    apt-get install wget -y && \
    apt-get install gettext-base -y && \
    echo "WordPress CONTAINER : Installing PHP..." && \
    apt-get install -y \
        curl \
        php7.3 \
        php-mysql \
        php-fpm \
        mariadb-client && \
        bash && \
    echo "WordPress CONTAINER : Downloading WordPress..." && \

    mkdir -p /var/www/html && \
    chown -R www-data:www-data /var/www/html && \
    mkdir -p /etc/conf/ && \
    mkdir -p /run/php && chown www-data:www-data /run/php && \
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv -f wp-cli.phar /usr/local/bin/wp && \
    wp core download --allow-root --path="/var/www/html"


COPY /conf/config_wp.sh /etc/conf/
COPY /conf/php.conf /etc/php/7.3/fpm/pool.d/www.conf


RUN chmod +x /etc/conf/config_wp.sh

CMD ["sh", "/etc/conf/config_wp.sh"]

EXPOSE 9000


