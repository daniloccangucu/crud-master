#!/bin/bash

sudo apt-get update

sudo apt-get install -y postgresql
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get install -y npm

sudo npm install -g pm2@4

git clone https://github.com/daniloccangucu/crud-master_inventory-app.git /home/vagrant/inventory-app
mv /home/vagrant/dotenv/.env /home/vagrant/inventory-app/.env
cd /home/vagrant/inventory-app
set -o allexport
source .env
set +o allexport

npm install

sudo -u postgres psql -f setup.sql
echo "ALTER USER postgres WITH PASSWORD '$PGPASSWORD';" > change_password.sql
sudo -u postgres psql -f change_password.sql

pm2 start ./src/server.js