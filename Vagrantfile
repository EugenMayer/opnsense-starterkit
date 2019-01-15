Vagrant.configure("2") do |config|
  config.vm.box = "eugenmayer/opnsense"

  # sepecial configurations for bsd shell / opnsense stuff
  config.ssh.sudo_command = "%c"
  config.ssh.shell = "/bin/sh"
  config.ssh.password = "opnsense"
  config.ssh.username = "root"
  
  # we do not need the default sync folder at all
  config.vm.synced_folder ".", "/vagrant", disabled: true
  
  # do not install guest additions
  config.vbguest.auto_update = false

  config.vm.define 'opnsense', autostart: false do |test|
    # setup network
    test.vm.provider 'virtualbox' do |vb|
      vb.customize ['modifyvm', :id, '--nic1', 'nat', '--nic2', 'intnet']
      vb.customize ['modifyvm', :id, '--natpf1', "https,tcp,127.0.0.1,10443,,443" ]
    end
  end  
end
