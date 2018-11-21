## Building yourself

Create a **deployable image** of opensense for virtualbox/kvm, **google compute** or **AWS EC**.
You build from the official iso (which you download yourself), so no tampering with the files. 
A custom `http/config.xml` is pre-deployed so you can SSH into your box after the first boot,
see "after deployed" to see what you need to revert so you are back to the default.

You will build using [Packer](https://www.packer.io/docs/installation.html)


 - Install [Packer](https://www.packer.io/docs/installation.html)
 - You need to download the opnsense.iso (17.7) and unpack it into this repo as opnsense.iso
 
 
### 17.7

```
cd build
wget https://opnsense.c0urier.net/releases/17.7/OPNsense-17.7.5-OpenSSL-dvd-amd64.iso.bz2
bunzip2 OPNsense-17.7.5-OpenSSL-dvd-amd64.iso.bz2
mv OPNsense-17.7.5-OpenSSL-dvd-amd64.iso opnsense.iso
packer build -var 'iso_sha256_checksum=29d16c6e03c2dbe1facc43d719150d91b84fa06baa834cfe8299212b52933c06' opnsense-18.1.json
```

### 18.1

```
cd build
wget https://opnsense.c0urier.net/releases/18.1/OPNsense-18.1-OpenSSL-dvd-amd64.iso.bz2
bunzip2 OPNsense-18.1-OpenSSL-dvd-amd64.iso.bz2
mv OPNsense-18.1-OpenSSL-dvd-amd64.iso opnsense.iso

shasum -a 256 opnsense.iso
packer build -var 'iso_sha256_checksum=58ccaf06aa7d14b13d3462a6aa157c265962313c040b6d033ea76546340670e2' opnsense-18.1.json 
```

This is yet needed since packer cannot (yet) download and unpack isos, it only can download non-archived isos

### 18.7

```
cd build
wget https://opnsense.c0urier.net/releases/18.7/OPNsense-18.7-OpenSSL-dvd-amd64.iso.bz2
bunzip2 OPNsense-18.7-OpenSSL-dvd-amd64.iso.bz2
mv OPNsense-18.7-OpenSSL-dvd-amd64.iso opnsense.iso
shasum -a 256 opnsense.iso
packer build -var 'iso_sha256_checksum=63c80d66c4de4eaf7c4d98976855112ad097f63dac06ba59a55fa40496de384a' opnsense.json 
```

## Accessing 

1. Import the OVF from output/virtualbox-iso/opnsense.ovf into your VirtualBox by double-clicking it
2. Start the VM
3. Access by ssh using `ssh -p 10022 root@localhost` or by web `https://localhost:10443` ( user root, password opnsense )

### After you deployed the image

Of course, change the configuration to your likings, but very specifically change

 - **!!!! change your root password !!!!**
 - **!!!! change your root password !!!!**
 - secure your SSH port which yet accessible through WAN
 - secure your webGUI port which yet accessible through WAN
 - enable bogus/private ip blocking on WAN which is disabled
 - disable SSH if you do not need it
 - disable SSH password access after you deployed your ssh key, if you leave SSH enabled

Since this has been adjusted so you can deploy a cloud image at all, right :)


## Advanced

### Updating the image version

If you want to use a newer opnsense version, you will need to

 - adjust `wget https://opnsense.c0urier.net/releases/17.7/OPNsense-17.7.5-OpenSSL-dvd-amd64.iso.bz2`
 - adjust the sha-sum of the **ISO(not bz2)**in the opnsense.json in the top `iso_sha256_checksum`
 - please create a pull request so i can update it

### Advanced building
    
    # download the iso beforehand
    # aws 18.1
    cd build
    packer build -var 'config_file=config-aws.xml' -var 'iso_sha256_checksum=6de0fe6ec3a7afdbca4d4e6b20aaefcb3ff97156ba8ab9e08d2f74826f26ccd7' opnsense.json
    ./tools/package_for_cloud.sh
    # you find your disk in output/cloud/disk.raw

    # download the iso beforehand
    # gce 18.1
    cd build
    packer build -var 'config_file=config-gce.xml' -var 'iso_sha256_checksum=6de0fe6ec3a7afdbca4d4e6b20aaefcb3ff97156ba8ab9e08d2f74826f26ccd7' opnsense.json
    ./tools/package_for_cloud.sh
    # you find your disk in output/cloud/disk.raw 
    
### Debug

add this to the vbox to be able to access the box

```
		,
        [
          "modifyvm",
          "{{.Name}}",
          "--natpf1",
          "managinggui,tcp,127.0.0.1,10443,,443"
        ],
        [
          "modifyvm",
          "{{.Name}}",
          "--natpf1",
          "ssh,tcp,127.0.0.1,10022,,22"
        ]
```

