# Script to setup / install webmin control panel.
# Author: SZ Quadri
rm -f /etc/yum.repos.d/webmin.repo
touch /etc/yum.repos.d/webmin.repo
echo '[Webmin]' >>  /etc/yum.repos.d/webmin.repo
echo 'name=Webmin Distribution Neutral' >>  /etc/yum.repos.d/webmin.repo
echo 'baseurl=http://download.webmin.com/download/yum' >>  /etc/yum.repos.d/webmin.repo
echo 'enabled=1' >>  /etc/yum.repos.d/webmin.repo
rpm --import http://www.webmin.com/jcameron-key.asc
yum install perl-Net-SSLeay -y
yum install webmin -y
