FROM alpine:3.18

ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_ROOT
ARG MYSQL_ROOT_PASSWORD

RUN mkdir -p /var/lib/mysql /var/run/mysqld && chmod -R 777 /var/run/mysqld

COPY ./conf/my.cnf /etc/mysql/my.cnf

RUN apk update && \
	apk add --no-cache mariadb mariadb-client && \
	chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

COPY ./tools/start_mariadb.sh /scripts/start_mariadb.sh

RUN chmod +x /scripts/start_mariadb.sh && ash -f /scripts/start_mariadb.sh

EXPOSE 3306

ENTRYPOINT [ "mariadbd-safe" ]