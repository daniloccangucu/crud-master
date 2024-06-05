# crud-master

## Overview

This project includes a CRUD system for managing movie information, user orders, and billing, integrated through an API gateway. The setup involves provisioning three separate applications: Inventory, Billing, and an API Gateway, using Vagrant and Shell scripts.

## Vagrantfile

The Vagrantfile sets up the virtual machines needed to run the services, specifying the configuration and provisioning scripts. Update the Vagrantfile with the appropriate network IPs for your environment:

```
Vagrant.configure("2") do |config|

  config.vm.define "inventory-vm" do |inventory|
    inventory.vm.network "private_network", ip: "INSERT_NETWORK_IP_1"
    ...
  end

  ...

  config.vm.define "billing-vm" do |billing|
    billing.vm.network "private_network", ip: "INSERT_NETWORK_IP_2"
    ...
  end

  ...

  config.vm.define "api-gateway-vm" do |gateway|
    gateway.vm.network "private_network", ip: "INSERT_NETWORK_IP_3"
    ...
  end

  ...
end
```
Replace `INSERT_NETWORK_IP_1`, `INSERT_NETWORK_IP_2`, and `INSERT_NETWORK_IP_3` with the desired IP addresses for your network configuration. Ensure that the IP address for `INSERT_NETWORK_IP_2` matches the IP addresses in the `.env` file.

## Environment Variables

The project requires specific environment variables stored in a `.env` file for configuration:

```
PGUSER=postgres
PGPASSWORD=password1
PGDATABASE=movies
PGHOST=localhost
PGPORT=5432
PG_2_USER=postgres
PG_2_PASSWORD=password1
PG_2_DATABASE=orders
PG_2_PORT=5432
RABBITMQ_URL=amqp://danilo:dan1234@192.168.33.11
RABBITMQ_QUEUE=billing_queue
RABBITMQ_USER=danilo
RABBITMQ_USER_PWD=dan1234
GATEWAY_PORT=3000
INVENTORY_API_URL=http://192.168.33.10:8080/movies
INVENTORY_PORT=8080
BILLING_PORT=3001
```

Ensure that the IP addresses (`INSERT_NETWORK_IP_2`) in the `.env` file match the IP addresses set in the Vagrantfile.

## Components

### API Gateway
The API Gateway handles routing requests to appropriate services and centralizes authentication. Provisioning script: `provision_api-gateway.sh`.

### Inventory Service
Manages movie inventory data. Provisioning script: `provision_inventory.sh`.

### Billing Service
Handles user orders and billing information. Provisioning script: `provision_billing.sh`.

## Provisioning Scripts

### `provision_api-gateway.sh`
Installs Node.js, npm, and pm2. Clones the API Gateway repository, sets environment variables, installs dependencies, and starts the server.

### `provision_inventory.sh`
Installs PostgreSQL, Node.js, npm, and pm2. Clones the Inventory repository, sets environment variables, initializes the database, and starts the server.

### `provision_billing.sh`
Installs PostgreSQL, RabbitMQ, Node.js, npm, and pm2. Clones the Billing repository, sets environment variables, initializes the database and RabbitMQ, and starts the server.

## Postman Collections

### `/api/billing/`
Contains CRUD operations for billing data. Includes requests for creating, reading, updating, and deleting billing information.

### `/movies`
Contains CRUD operations for movie data. Includes requests for creating, reading, updating, and deleting movie information.

### `/movies/:id`
Contains operations for handling movie data by ID. Includes requests for getting, updating, and deleting a movie by its ID.

## Repositories

- [Billing App](https://github.com/daniloccangucu/crud-master_billing-app)
- [API Gateway](https://github.com/daniloccangucu/crud-master_api-gateway)
- [Inventory API](https://github.com/daniloccangucu/crud-master_inventory-api)

## Instructions

1. Clone this repositories.
2. Place the `.env` file in the root directory.
3. Run `vagrant up` to start the virtual machines.
4. Check the status with `vagrant status`.
5. Use the provided Postman collections to interact with the APIs.
