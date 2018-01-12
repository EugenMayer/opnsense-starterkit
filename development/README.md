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
````

