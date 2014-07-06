google-authenticator setup
=======================================


Make sure EPEL repo is setup. If not add this repo your system.


yum install ntp

chkconfig ntpd on
ntpdate pool.ntp.org
yum --enablerepo=epel install gcc gcc++ pam-devel subversion python-devel
yum --enablerepo=epel install git

yum install google-authenticator -y


Setup PAM authentication 
----------------------------------

vim /etc/pam.d/sshd

insert/add "auth required pam_google_authenticator.so" line at the top


vim /etc/ssh/sshd_config 

uncomment line "#ChallengeResponseAuthentication yes"
comment out line "ChallengeResponseAuthentication no"
make sure "UsePAM yes" is there

service sshd restart

Run and Generate OPT KEY
-------------------------------
google-authenticator

Answer Yes to everything except the “you can increase the window from its default


You are in business!






Ref: http://kiteplans.info/2012/04/06/two-factor-ssh-virtualmin-authentication-google-authenticator/

IMP: remember to add "auth required pam_google_authenticator.so" at the top of /etc/pam.d/sshd


Note:  
----------
http://zews.org/google-authenticator requires some more steps for use with Selinux but we do not find it to be the case. 
Use this link for future exploration.

