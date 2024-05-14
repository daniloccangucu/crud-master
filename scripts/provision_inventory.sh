#!/bin/bash

# Update package index
sudo apt-get update

# Install PostgreSQL
sudo apt get install -y postgresql nodejs

mkdir -p /home/vagrant/inventory-app
git clone https://github.com/daniloccangucu/crud-master_inventory-app.git /home/vagrant/inventory-app

# Install dependencies and start inventory application
cd /home/vagrant/inventory-app
# npm install
