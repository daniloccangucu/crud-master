Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.hostname = "inventory-vm"

  config.vm.provision "shell", inline: <<-SHELL
  mkdir -p /home/vagrant/dotenv
  cp /vagrant/.env /home/vagrant/dotenv/.env
    SHELL

  config.vm.provision "shell", path: "scripts/provision_inventory.sh"
end
