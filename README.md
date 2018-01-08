## WAT

Create a **deployable image** of opensense for **google compute** or **AWS EC**.
You build from the offiicial iso, so no tampering with the files. A customer config.xml is deployed so you can SSH
boot into your box, see "after deployed" to see what you need to revert so you are back to the default

You will build using [Packer](https://www.packer.io/docs/installation.html)

## requirements
 - Install [Packer](https://www.packer.io/docs/installation.html)
 - You need to download the opnsense.iso (16.7) and unpack it into this repo as opnsense.iso
 
```
wget https://opnsense.c0urier.net/releases/17.7/OPNsense-17.7.5-OpenSSL-dvd-amd64.iso.bz2
bunzip2 OPNsense-17.7.5-OpenSSL-dvd-amd64.iso.bz2
mv OPNsense-17.7.5-OpenSSL-dvd-amd64.iso opnsense.iso
```

This is yet needed since packer cannot (yet) download and unpack isos, it only can download non-archived isos

## build

    packer build opnsense.json
    
    
## after you deployed the image

Of course, chaneg the configuration to your likings, but very specificly change

 - **!!!! change your root password !!!!**
 - **!!!! change your root password !!!!**
 - secure your SSH port which yet accessible through WAN
 - secure your webGUI port which yet accessible through WAN
 - enable bogus/private ip blocking on WAN which is disabled
 - disable SSH if you do not need it
 - disable SSH password access after you deployed your ssh key, if you leave SSH enabled

Since this has been adjusted so you can deploy a cloud image at all, right :)

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