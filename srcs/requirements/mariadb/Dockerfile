# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: npatron <npatron@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/07/27 17:32:34 by npatron           #+#    #+#              #
#    Updated: 2024/08/07 15:16:31 by npatron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

ENV DB_NAME=$DB_NAME
ENV DB_USER=$DB_USER
ENV DB_PASSWORD=$DB_PASSWORD

RUN echo "MariaDB CONTAINER : Checking new packages available..."
RUN apt-get update -y && apt-get upgrade -y

RUN	echo "MariaDB CONTAINER : Installation of MariaDB..."
RUN	apt-get install mariadb-server -y
RUN apt-get install sudo -y

RUN mkdir -p /etc/sh/
RUN mkdir -p /var/run/mysqld

RUN chown mysql:mysql /var/run/mysqld



COPY /conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY /sh/init_db.sh /etc/sh/init_db.sh

RUN chmod +x /etc/sh/init_db.sh

CMD ["sh", "/etc/sh/init_db.sh"]