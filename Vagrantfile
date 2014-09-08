# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.require_version ">= 1.4.0"

BOX_NAME = "docker-demo"

Vagrant.configure("2") do |config|
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

  config.vm.define BOX_NAME do |t| end

  config.vm.box = "Ubuntu 14.04"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/trusty/20140904/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  config.vm.hostname = "#{BOX_NAME}.localdomain"
  config.vm.provider :virtualbox do |vbox|
    vbox.name = BOX_NAME
    vbox.memory = 1024
  end

  config.vm.provision "docker", version: "1.2.0"
  config.vm.provision :shell, :inline => "mkdir -p /var/lib/cloud/instance; touch /var/lib/cloud/instance/locale-check.skip"
end

