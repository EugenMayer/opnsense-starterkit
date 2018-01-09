## WAT

Create a **deployable image** of opensense for virtualbox/kvm, **google compute** or **AWS EC**.
You build from the official iso (which you download yourself), so no tampering with the files. 
A custom `http/config.xml` is pre-deployed so you can SSH into your box after the first boot,
see "after deployed" to see what you need to revert so you are back to the default.

You will build using [Packer](https://www.packer.io/docs/installation.html)

## requirements
 - Install [Packer](https://www.packer.io/docs/installation.html)
 - You need to download the opnsense.iso (17.7) and unpack it into this repo as opnsense.iso
 
```
wget https://opnsense.c0urier.net/releases/17.7/OPNsense-17.7.5-OpenSSL-dvd-amd64.iso.bz2
bunzip2 OPNsense-17.7.5-OpenSSL-dvd-amd64.iso.bz2
mv OPNsense-17.7.5-OpenSSL-dvd-amd64.iso opnsense.iso
```

This is yet needed since packer cannot (yet) download and unpack isos, it only can download non-archived isos

## build

    # general
    packer build opnsense.json
    
    # aws
    packer build --var 'config_file=config-aws.xml' opnsense.json 
    ./tools/package_for_cloud.sh
    # you find your disk in output/cloud/disk.raw

    # gce
    packer build --var 'config_file=config-gce.xml' opnsense.json
    ./tools/package_for_cloud.sh
    # you find your disk in output/cloud/disk.raw 
    
    
## after you deployed the image

Of course, change the configuration to your likings, but very specifically change

 - **!!!! change your root password !!!!**
 - **!!!! change your root password !!!!**
 - secure your SSH port which yet accessible through WAN
 - secure your webGUI port which yet accessible through WAN
 - enable bogus/private ip blocking on WAN which is disabled
 - disable SSH if you do not need it
 - disable SSH password access after you deployed your ssh key, if you leave SSH enabled

Since this has been adjusted so you can deploy a cloud image at all, right :)

## Internals

 - currently using MBR layout to be more supportive towards AWS, yet not working

## Update the image version

If you want to use a newer opnsense version, you will need to

 - adjust `wget https://opnsense.c0urier.net/releases/17.7/OPNsense-17.7.5-OpenSSL-dvd-amd64.iso.bz2`
 - adjust the sha-sum in the opnsense.json in the top `iso_sha256_checksum`
 - please create a pull request so i can update it
   
## Debug

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