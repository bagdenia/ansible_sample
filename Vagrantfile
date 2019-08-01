# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define 'dockerized' do |machine|
    machine.vm.box = "williamyeh/ubuntu-trusty64-docker"

    machine.vm.network "forwarded_port", guest: 80, host: 8080
    machine.vm.network "forwarded_port", guest: 5432, host: 8081
    machine.vm.network "forwarded_port", guest: 6379, host: 8082
  end


  config.vm.define 'empty_ubuntu' do |machine|
    machine.vm.box = 'generic/ubuntu1804'
    machine.vm.network "forwarded_port", guest: 22, host: 2222, auto_correct: true

    public_key = File.read("#{ENV['HOME']}/.ssh/id_rsa.pub")
    script = <<SCRIPT
      apt install -y python
      echo "#{public_key}" >> /home/vagrant/.ssh/authorized_keys
SCRIPT

    machine.vm.provision :shell, inline: script
  end
end
