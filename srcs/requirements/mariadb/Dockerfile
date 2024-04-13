FROM alpine:3.18

RUN apk update
RUN apk add --no-cache mariadb mariadb-client mariadb-server-utils && \
	rm -f /var/cache/apk/*

ADD ./conf/start_mariadb.sh /scripts/start_mariadb.sh
RUN chmod -R 775 /scripts

EXPOSE 3306

RUN chmod +x /scripts/start_mariadb.sh
ENTRYPOINT [ "ash", "/scripts/start_mariadb.sh" ]