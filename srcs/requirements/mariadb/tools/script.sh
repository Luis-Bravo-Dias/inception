#!/bin/bash

service mysql start;

sleep 3;

mysql -u root -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mysql -u root -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -u root -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mysql -u root -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p $SQL_ROOT_PASSWORD shutdown
exec mysqld_safe

if [ ! -d "/var/lib/mysql/$SQL_DATABASE" ]; then

service mysql start;

# sleep 3;


# echo "Creating admin user"
# mysql -u root -e "CREATE DATABASE $SQL_DATABASE;"
# mysql -u root -e "CREATE USER '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';"
# mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO '$SQL_USER'@'%';"
# mysql -u root -e "FLUSH PRIVILEGES;"

# echo "Setting password for root user"
# mysqladmin -u root password "$SQL_PASSWORD"

# mysqladmin -u root -p"$SQL_PASSWORD" shutdown
# fi

# exec mysqld_safe --bind-address=0.0.0.0