


### Watch a list of processes trying to connect to port 25
```
watch -n 2 "lsof -i:25 "
```

### list network connection with pid/user etc
```
netstat -pet
```

### watch list of connections
```
watch -d -n0 "netstat -atnp | grep ESTA"
```

## booting livecd: disable attached HDD using kernel boot parameter
```
libata.force=1.00:disable
```
Ref: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=b8bd6dc36186fe99afa7b73e9e2d9a98ad5c4865

