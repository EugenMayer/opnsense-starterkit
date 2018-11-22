Vagrant.configure("2") do |config|
  config.vm.box = "rudibroekhuizen/opnsense"

  # sepecial configurations for bsd shell / opnsense stuff
  config.ssh.sudo_command = "%c"
  config.ssh.shell = "/bin/sh"
  config.ssh.password = "opnsense"
  config.ssh.username = "root"
  # we do not need the default sync folder at all
  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.define 'opnsense', autostart: false do |test|
    # setup network
    test.vm.provider 'virtualbox' do |vb|
      # Vagrant wants nic1 to be a NAT interface, nic2 intnet
      # Vagrant set port forwarding on the first NAT interface (nic1) for ssh 22->2222:
      vb.customize ['modifyvm',:id, '--nic1', 'nat', '--nic2', 'intnet'] # swap the networks around
      # WebGUI through WAN interface, nic1:
      vb.customize ['modifyvm', :id, '--natpf1', "https,tcp,127.0.0.1,10443,,443" ] #port forward
    end
  end  
end
