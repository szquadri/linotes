
### list commit id of HEAD for all repos under given dir
````
find . -type d -name .git -exec sh -c "cd \"{}\"/../ && pwd && git log --pretty=oneline master -1" \;
````
or

```
find . -type d -name .git -exec sh -c "cd \"{}\"/../ && pwd && git rev-parse HEAD" \;
```


### Watch a list of processes trying to connect to port 25
```
watch -n 2 "lsof -i:25 "
```

### list network connection with pid/user etc
```
netstat -pet
```

###delete files having Jan 26 as date in current folder
```
ls -l . |grep "^-.*Jan 26" | awk '{print $9}' |xargs rm
```


### Disallow user foo to make any outgoing connections
```
iptables -I OUTPUT -o eth0 -m owner --uid-owner foo -j REJECT
iptables -I OUTPUT -o eth1 -m owner --uid-owner foo -j REJECT
iptables -I OUTPUT -o lo -m owner --uid-owner foo -j REJECT
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

## find outgoing dns queries on a host
```
tshark -f "udp port 53" -R "dns.qry.type == A and dns.flags.response == 0"
-or-
tcpdump -vvv -s 0 -l -n port 53
```
