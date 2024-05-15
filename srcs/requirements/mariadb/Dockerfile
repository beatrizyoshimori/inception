FROM alpine:3.18

ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_ROOT
ARG MYSQL_ROOT_PASSWORD

RUN mkdir -p /var/lib/mysql /var/run/mysqld && chmod -R 777 /var/run/mysqld

COPY ./config/my.cnf /etc/mysql/my.cnf

RUN apk update
RUN apk add --no-cache mariadb mariadb-client && \
	# rm -f /var/cache/apk/* && \
	chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

COPY ./tools/start_mariadb.sh /scripts/start_mariadb.sh
RUN chmod -R 775 /scripts/start_mariadb.sh

EXPOSE 3306

RUN chmod +x /scripts/start_mariadb.sh
ENTRYPOINT [ "ash", "/scripts/start_mariadb.sh" ]

# FROM alpine:3.18

# ARG MYSQL_USER
# ARG MYSQL_PASSWORD
# ARG MYSQL_DATABASE
# ARG MYSQL_ROOT
# ARG MYSQL_ROOT_PASSWORD

# RUN apk update && apk add --no-cache mariadb mariadb-client

# COPY ./config/my.cnf /etc/mysql/my.cnf

# COPY ./tools/start_mariadb.sh /usr/local/bin/start_mariadb.sh

# RUN chmod +x /usr/local/bin/start_mariadb.sh && ash -f /usr/local/bin/start_mariadb.sh

# EXPOSE 3306

# ENTRYPOINT ["mariadbd-safe"]