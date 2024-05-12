FROM alpine:3.18

# ARG MYSQL_DATABASE
# ARG MYSQL_USER
# ARG MYSQL_PASSWORD
# ARG MYSQL_ROOT
# ARG MYSQL_ROOT_PASSWORD

RUN mkdir -p /var/lib/mysql /var/run/mysqld && chmod -R 777 /var/run/mysqld

RUN apk update
RUN apk add --no-cache mariadb mariadb-client && \
	# rm -f /var/cache/apk/* && \
	chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

COPY ./config/my.cnf /etc/mysql/my.cnf
COPY ./tools/start_mariadb.sh /scripts/start_mariadb.sh
RUN chmod -R 775 /scripts/start_mariadb.sh

EXPOSE 3306

RUN chmod +x /scripts/start_mariadb.sh
ENTRYPOINT [ "ash", "/scripts/start_mariadb.sh" ]

# FROM debian:oldstable

# ARG MYSQL_DATABASE
# ARG MYSQL_USER
# ARG MYSQL_PASSWORD
# ARG MYSQL_ROOT
# ARG MYSQL_ROOT_PASSWORD

# RUN apt update && apt upgrade -y && \
# 	apt install -y \
# 	mariadb-server && \
# 	rm -rf /var/lib/apt/lists/*

# RUN mkdir -p /var/run/mysqld && \
# 	chown -R mysql:mysql /var/run/mysqld && \
# 	chmod 777 /var/run/mysqld

# COPY ./config/my.cnf /etc/mysql/my.cnf
# COPY ./tools/start_mariadb.sh /tmp/start_mariadb.sh

# RUN chmod +x /tmp/start_mariadb.sh && \
# 	/tmp/start_mariadb.sh

# CMD ["mysqld_safe"]