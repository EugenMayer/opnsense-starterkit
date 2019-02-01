## WAT

You want to either quickly 

1. try [OPNsense](https://opnsense.org).  See blow 'Trying OPNsense'
2. or build an image for your infrastructure right from the ISO / from scratch. See [the build guide](https://github.com/EugenMayer/packer-opnsense/tree/master/build)
3. Or start developing opnsense with one line, see [the development quicksetup guide](https://github.com/EugenMayer/opnsense-starterkit/tree/master/development)
4. Test the current most rest opnsense development version without any effort? Check [the development quicksetup guide](https://github.com/EugenMayer/packer-opnsense/tree/master/development) - you get a "from source" version after running 1 command

## Trying OPNsense

 - Install vagrant https://www.vagrantup.com/downloads.html
 
 ```
mkdir /tmp/mytest && cd /tmp/mytest
curl -o Vagrantfile https://raw.githubusercontent.com/EugenMayer/packer-opnsense/master/Vagrantfile
vagrant up opnsense
```

Now you can either access OPNsense using `https://localhost:10443` or by `ssh -p 10022 root@localhost`

Username: root
Password: opnsense

To see which versions are available, check https://app.vagrantup.com/eugenmayer/boxes/opnsense
