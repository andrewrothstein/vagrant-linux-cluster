# -*- mode: ruby -*-
# vi: set ft=ruby :

$num_instances = 3
$network_prefix = "192.168.99"
$instance_ram_mb = 2048

Vagrant.configure("2") do |config|

  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.manage_guest = true

  config.vm.box = "generic/alpine319"

  (1..$num_instances).each do |i|
    config.vm.define vm_name = "node-#{i}.vagrant.test" do |config|
      config.vm.hostname = vm_name

      ip = "#{$network_prefix}.#{i+9}"
      config.vm.network :private_network, ip: ip

      config.vm.provider "virtualbox" do |vb|
        vb.memory = $instance_ram_mb
        vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
      end

      config.vm.provision "shell" do |s|
        ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_rsa.pub").first.strip
        s.inline = <<-SHELL
echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
apk update && apk upgrade && apk add python3
SHELL
      end
    end
  end
end
