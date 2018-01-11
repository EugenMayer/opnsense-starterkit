# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.box = "eugenmayer/opnsense"
  config.vm.define 'opnsense', autostart: false do |test|
    test.vm.provider 'virtualbox' do |vb|
      vb.customize ['modifyvm',:id, '--nic1', 'intnet', '--nic2', 'nat'] # swap the networks around
      vb.customize ['modifyvm', :id, '--natpf2', "ssh,tcp,127.0.0.1,2222,,22" ] #port forward
      vb.customize ['modifyvm', :id, '--natpf2', "https,tcp,127.0.0.1,10443,,443" ] #port forward
      vb.customize ['modifyvm', :id, '--natpf1', "https,tcp,127.0.0.1,1443,,443" ] #port forward
    end
    #test.vm.network "forwarded_port", id: 'ssh', guest: 22, host_ip: '127.0.0.1', host: 52222, auto_correct: false, adapter: 1
  end
end
