# # !/bin/sh

mariadb-install-db --user=mysql --datadir=/var/lib/mysql
mariadbd-safe &
sleep 4; sleep 2

mariadb -e "FLUSH PRIVILEGES"
mariadb -e "SET PASSWORD FOR 'root'@'localhost'=PASSWORD('$MYSQL_ROOT_PASSWORD');"
mariadb -e "DROP DATABASE IF EXISTS test;"
mariadb -e "FLUSH PRIVILEGES"
mariadb -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE CHARACTER SET utf8 COLLATE utf8_general_ci;"
mariadb -e "GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mariadb -e "GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';"
mariadb -e "GRANT ALL ON *.* TO 'root'@'%' identified by '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION;"
mariadb -u root -p"$MYSQL_ROOT_PASSWORD" -e "FLUSH PRIVILEGES"

# /usr/bin/mysqld --user=mysql --verbose=0 --skip-networking=0

# #!/bin/ash

# mariadb-install-db --user=mysql --datadir=/var/lib/mysql

# mariadbd-safe &

# sleep 8

# mariadb -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE; \
# CREATE USER '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD'; \
# GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; \
# ALTER USER '$MYSQL_ROOT'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; \
# FLUSH PRIVILEGES;"

# echo "MariaDB configuration complete."
