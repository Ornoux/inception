# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: npatron <npatron@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/07/27 17:32:34 by npatron           #+#    #+#              #
#    Updated: 2024/08/04 17:17:20 by npatron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest


ENV MARIADB_ROOT_PASSWORD=rootpassword
ENV	MARIADB_DATABASE=mariadb
ENV	MARIADB_USER=npatron
ENV	MARIADB_PASSWORD=mypassword
ENV	DOMAIN=npatron.42.fr

RUN echo "MariaDB CONTAINER : Checking new packages available..."
RUN apk update && apk upgrade

RUN	echo "MariaDB CONTAINER : Installation of MariaDB..."
RUN	apk add mariadb

RUN mkdir -p /etc/sh/

COPY /conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY /sh/init_db.sh /etc/sh/init_db.sh

RUN chmod +x /etc/sh/init_db.sh

# CMD ["sh", "/etc/sh/init_db.sh"]