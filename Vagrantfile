Vagrant.configure("2") do |config|
  # Config for inventory-vm
  config.vm.define "inventory-vm" do |inventory|
    inventory.vm.box = "ubuntu/bionic64"
    inventory.vm.network "private_network", ip: "INSERT_NETWORK_IP_1"
    inventory.vm.network "forwarded_port", guest: 8080, host: 8080
    inventory.vm.hostname = "inventory-vm"

    inventory.vm.provision "shell", inline: <<-SHELL
    mkdir -p /home/vagrant/dotenv
    cp /vagrant/.env /home/vagrant/dotenv/.env
      SHELL

    inventory.vm.provision "shell", path: "scripts/provision_inventory.sh"
end

# Config for billing-vm
config.vm.define "billing-vm" do |billing|
  billing.vm.box = "ubuntu/bionic64"
  billing.vm.network "private_network", ip: "INSERT_NETWORK_IP_2"
  billing.vm.network "forwarded_port", guest: 3001, host: 3001
  billing.vm.network "forwarded_port", guest: 5672, host: 5672
  billing.vm.network "forwarded_port", guest: 15672, host: 15672
  billing.vm.hostname = "billing-vm"

  billing.vm.provision "shell", inline: <<-SHELL
  mkdir -p /home/vagrant/dotenv
  cp /vagrant/.env /home/vagrant/dotenv/.env
    SHELL

  billing.vm.provision "shell", path: "scripts/provision_billing.sh"
end

# Config for api-gateway-vm
config.vm.define "api-gateway-vm" do |gateway|
  gateway.vm.box = "ubuntu/bionic64"
  gateway.vm.network "private_network", ip: "INSERT_NETWORK_IP_3"
  gateway.vm.network "forwarded_port", guest: 3000, host: 3000
  gateway.vm.hostname = "api-gateway-vm"

  gateway.vm.provision "shell", inline: <<-SHELL
    mkdir -p /home/vagrant/dotenv
    cp /vagrant/.env /home/vagrant/dotenv/.env
  SHELL

  gateway.vm.provision "shell", path: "scripts/provision_api-gateway.sh"
end
end