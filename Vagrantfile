Vagrant.configure("2") do |config|
  config.vm.box = "eugenmayer/opnsense"

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
      # since opnsense expects nic1 (first) to be LAN, lets make it intnet
      # nic2 is wan, so we are doing nat ( routed to the host )
      vb.customize ['modifyvm',:id, '--nic1', 'intnet', '--nic2', 'nat'] # swap the networks around
      # we forward the ports to the WebGUI/ssh since we use a nat network
      vb.customize ['modifyvm', :id, '--natpf2', "ssh,tcp,127.0.0.1,2222,,22" ] #port forward
      vb.customize ['modifyvm', :id, '--natpf2', "https,tcp,127.0.0.1,10443,,443" ] #port forward
    end
end
