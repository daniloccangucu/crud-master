Vagrant.configure("2") do |config|
  # Config for iventory-vm
  config.vm.define "invetory-vm" do |inventory|
    inventory.vm.box = "ubuntu/bionic64"
    inventory.vm.network "private_network", ip: "192.168.33.10"
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
  billing.vm.network "private_network", ip: "192.168.33.11"
  billing.vm.network "forwarded_port", guest: 5001, host: 5001
  billing.vm.hostname = "billing-vm"

  billing.vm.provision "shell", inline: <<-SHELL
  mkdir -p /home/vagrant/dotenv
  cp /vagrant/.env /home/vagrant/dotenv/.env
    SHELL

  billing.vm.provision "shell", path: "scripts/provision_billing.sh"
end
end