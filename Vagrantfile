# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.network :forwarded_port, guest: 5432,  host: 5432  # postgresql
  config.vm.network :forwarded_port, guest: 5984,  host: 5984  # couchdb
  config.vm.network :forwarded_port, guest: 27017, host: 27017 # mongodb
  config.vm.network :forwarded_port, guest: 28017, host: 28017 # mongodb admin web console
  config.vm.network :forwarded_port, guest: 6379,  host: 6379  # redis
  config.vm.network :forwarded_port, guest: 7474,  host: 7474  # neo4j
  config.vm.network :forwarded_port, guest: 8087,  host: 8087  # riak
  config.vm.network :forwarded_port, guest: 8098,  host: 8098  # riak

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network :private_network, ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network :public_network

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  config.vm.provision :shell, :path => "bootstrap.sh"

  # Use 1gb ram instead of vagrant's 512mb default
  config.vm.provider "virtualbox" do |vm|
    vm.customize ["modifyvm", :id, "--memory", 1024]
  end
end
