# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  
  config.vm.define :vm_name do |config|
    config.vm.box = "debian-squeeze-64-rvm"
    config.vm.forward_port 80,8080
    config.vm.network :hostonly, "192.168.0.0"
    config.vm.customize ["modifyvm", :id, "--memory", 1024]
    config.vm.share_folder("v-root", "/vagrant", ".", :nfs => true)
  end

end
