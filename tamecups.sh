# Allow Printer sharing via CUPS
# Ref: https://wiki.archlinux.org/index.php/CUPS_printer_sharing#Sharing_via_IPP
IP=ifconfig eth0 | sed '/inet\ /!d;s/.*r://g;s/\ .*//g' 
echo "Cups deamon shall listen on $IP"
sed -i "s/localhost:631/$IP:631/g" /etc/cups/cupsd.conf
chkconfig --level 35 cups on 
/etc/init.d/cups restart
