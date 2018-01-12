## Development with OPNsense

This is just the fastes way to bring up a development ready opnsense box for you to start with

### Start
```
make start
```

1. You can know go ahead an change anything in this `./core` right in this folder locally.
2. It will get synced and be reflected in the running instance. Thats it!.
   (If you are under OSX, rsync does not detect changes. Run `vagrant rsycn` to sync your changes)
3. Its all on you now :)

### Stop ( pause )
To stop the vm ( not losing state, continue later )
```   
make stop
```

### Rm ( end, remove all )
To remove the VM
```
make rm
```
# What to do from here

If you want to work on the core, you want to 

1. Fork https://github.com/opnsense/core on github and create branch
2. Copy this folder and make it a repo
3. Replace https://github.com/EugenMayer/packer-opnsense/blob/master/development/makefile#L8 with your repo and branch `-b feature/myfeature`
4. Push your "develoment repo" on github, YourName/opnsense-featureA

Should you be in need to work on a Plugin

1. If you need core, changed, do the above and continue from 3
2. Copy this folder and make it a repo
3. create the folder `src` and add it to your repo - that will be your source of your plugin
4. Add your folder to the syncs https://github.com/EugenMayer/packer-opnsense/blob/master/development/Vagrantfile#L14 so **add** this lines below like

```
 test.vm.synced_folder "./src", "/root/core", type: "rsync",
      rsync__chown: false,
      rsync__exclude: "./core/.git/"
```
