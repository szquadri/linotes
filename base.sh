# A base server should have the following stuff to make sysadmin happy
yum install wget mc strace sysstat dstat htop iftop iptraf mtr jwhois mutt elinks tmux screen -y

# This repo is required to get many packages such as proftpd etc 
rpm -Uvh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-7.noarch.rpm
