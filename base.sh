# A base server should have the following stuff to make sysadmin happy
yum install wget mc nc socat strace sysstat dstat hdparm htop iftop atop iptraf mtr jwhois mutt elinks tmux screen -y

# stuff required for bare metal servers like virt hardware nodes
yum install smartmontools -y

# This repo is required to get many packages such as proftpd etc 
rpm -Uvh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-7.noarch.rpm
