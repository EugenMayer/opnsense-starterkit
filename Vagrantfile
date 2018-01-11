Vagrant.configure("2") do |config|
  config.vm.box = "eugenmayer/opnsense"
  #config.vm.box = "~/package.box"

  # d
  #config.ssh.sudo_command = "%c"
  config.ssh.shell = "/bin/sh"
  config.ssh.password = "opnsense"
  config.ssh.username = "root"
  # we need to use rsync, no vbox drivers for bsd
  config.vm.synced_folder ".", "/vagrant", type: "rsync"
  config.vm.define 'opnsense', autostart: false do |test|
    test.vm.provider 'virtualbox' do |vb|
      vb.customize ['modifyvm',:id, '--nic1', 'intnet', '--nic2', 'nat'] # swap the networks around
      vb.customize ['modifyvm', :id, '--natpf2', "ssh,tcp,127.0.0.1,2222,,22" ] #port forward
      vb.customize ['modifyvm', :id, '--natpf2', "https,tcp,127.0.0.1,10443,,443" ] #port forward
      vb.customize ['modifyvm', :id, '--natpf1', "https,tcp,127.0.0.1,1443,,443" ] #port forward
    end
  end
end
