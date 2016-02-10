


### Watch a list of processes trying to connect to port 25
watch -n 2 "lsof -i:25 "


### list network connection with pid/user etc
netstat -pet

### watch list of connections
watch -d -n0 "netstat -atnp | grep ESTA"
