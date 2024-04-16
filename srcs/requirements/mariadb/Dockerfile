FROM alpine:3.18

RUN mkdir -p /var/lib/mysql /var/run/mysqld && chmod -R 777 /var/run/mysqld

RUN apk update
RUN apk add --no-cache mariadb mariadb-client mariadb-server-utils && \
	# rm -f /var/cache/apk/* && \
	chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

ADD ./conf/start_mariadb.sh /scripts/start_mariadb.sh
RUN chmod -R 775 /scripts

EXPOSE 3306

RUN chmod +x /scripts/start_mariadb.sh
ENTRYPOINT [ "ash", "/scripts/start_mariadb.sh" ]