# This repo is required to get many packages such as atop, iftop, socat etc 
rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm

# A base server should have the following stuff to make sysadmin happy
yum install wget mc nc socat strace sysstat dstat psacct hdparm htop iftop atop iptraf mtr jwhois mutt elinks tmux screen -y

chkconfig --level 35 psacct on

# stuff required for bare metal servers like virt hardware nodes
yum install smartmontools -y

