#!/bin/bash

sudo apt-get update

curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get install -y npm

sudo npm install -g pm2@4

git clone https://github.com/daniloccangucu/crud-master_api-gateway.git /home/vagrant/api-gateway
mv /home/vagrant/dotenv/.env /home/vagrant/api-gateway/.env
cd /home/vagrant/api-gateway
set -o allexport
source .env
set +o allexport

npm install

pm2 start server.js --name api-gateway
