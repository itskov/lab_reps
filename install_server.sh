#!/bin/bash
virtualenv -p python2.7 ./venv/
source ./venv/bin/activate


# Install the database
sudo apt install mysql-server

# Setting root password
sudo mysql -p -e "use mysql; UPDATE user SET plugin='mysql_native_password' WHERE user='root';"
sudo mysql -p -e "FLUSH PRIVILEGES;"
sudo mysql -p -e  "ALTER USER 'root'@'localhost' IDENTIFIED WITH 'mysql_native_password' BY 'Password1';"



