# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "canonical-ubuntu-12.04"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"
  
  # Ensure Chef is installed for provisioning
  config.omnibus.chef_version = :latest

  config.berkshelf.enabled = true
  
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.ignore_private_ip = false
  
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048", "--cpus", "2"]
  end

  config.vm.define 'greg' do |greg|
    greg.vm.network :private_network, ip: "33.33.33.31"
    
    greg.vm.hostname = "greg.wso2.local"
    
    greg.vm.provision :chef_solo do |chef|
      chef.json = {
        run_list: ["recipe[soa_tools::wso2greg]"]
      }
    end
  end

  config.vm.define 'bam' do |bam|
    bam.vm.network :private_network, ip: "33.33.33.32"
    
    bam.vm.hostname = "bam.wso2.local"
    
    bam.vm.provision :chef_solo do |chef|
      chef.json = {
        run_list: ["recipe[soa_tools::wso2bam]"]
      }
    end
  end
end
