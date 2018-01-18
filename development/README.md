## Development with OPNsense

This is probably the fastes way to bring up a development ready opnsense box for you to start with.

You can see that in action for those two plugins:
 
 - https://github.com/EugenMayer/opnsense-unbound-plugin
 - https://github.com/EugenMayer/opnsense-openvpn-plugin
 
 You can just clone one of that, run `make start` and you are set to go. You can access a opnsense with those plugins installed and can change code and see them happening in the installation.
 
Interesting sidenote:
Also a config.xml is predeployed for each plugin with the specific config like a openvpn server or radius, so you do not need to configure your fresh installation every time you start developing.

### Start
```
make start
```

1. You can know go ahead an change anything in this `./core` right in this folder locally.
2. It will get synced and be reflected in the running instance. Thats it!.
   (If you are under OSX, rsync does not detect changes. Run `vagrant rsycn` to sync your changes)
3. Its all on you now :)


### Rm ( end, remove all )
To remove the VM
```
make rm
```
