#!/bin/bash

sudo apt-get update

sudo apt-get install -y postgresql postgresql-contrib
sudo apt-get install -y rabbitmq-server

sudo systemctl start rabbitmq-server
sudo systemctl enable rabbitmq-server

sudo rabbitmq-plugins enable rabbitmq_management
sudo systemctl restart rabbitmq-server

curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get install -y npm

sudo npm install -g pm2@4

git clone https://github.com/daniloccangucu/crud-master_billing-app.git /home/vagrant/billing-app
mv /home/vagrant/dotenv/.env /home/vagrant/billing-app/.env
cd /home/vagrant/billing-app
set -o allexport
source .env
set +o allexport

sudo rabbitmqctl add_user $RABBITMQ_USER $RABBITMQ_USER_PWD
sudo rabbitmqctl set_user_tags $RABBITMQ_USER administrator
sudo rabbitmqctl set_permissions -p / $RABBITMQ_USER ".*" ".*" ".*"

npm install

sudo -u postgres psql -f src/setup.sql
echo "ALTER USER postgres WITH PASSWORD '$PGPASSWORD';" > change_password.sql
sudo -u postgres psql -f change_password.sql

pm2 start ./src/server.js --name billing_app