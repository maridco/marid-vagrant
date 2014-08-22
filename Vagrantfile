# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure('2') do |config|
  config.vm.box      = 'cloud64'
  config.vm.box_url  = 'https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box'
  config.vm.hostname = 'rails-dev-box'
  config.vm.provider "virtualbox" do |v|
        v.memory = 1024
        v.cpus = 2
  end
  
  config.vm.provision :file do |file|
      file.source      = 'Gemfile'
      file.destination = '/home/vagrant/Gemfile'
  end

  config.vm.provider 'parallels' do |v, override|
    override.vm.box = 'parallels/ubuntu-12.04'
    override.vm.box_url = 'https://vagrantcloud.com/parallels/ubuntu-12.04'

    # Can be running at background, see https://github.com/Parallels/vagrant-parallels/issues/39
    v.customize ['set', :id, '--on-window-close', 'keep-running']
  end

  config.vm.network :forwarded_port, guest: 3000, host: 3000

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'puppet/manifests'
    puppet.module_path    = 'puppet/modules'
  end
end
