google-authenticator setup
=======================================


Folow: http://kiteplans.info/2012/04/06/two-factor-ssh-virtualmin-authentication-google-authenticator/

IMP: remember to add "auth required pam_google_authenticator.so" at the top of /etc/pam.d/sshd


Note:  
----------
http://zews.org/google-authenticator requires some more steps for use with Selinux but we do not find it to be the case. 
Use this link for future exploration.

