# install nux desktop repo
rpm -i http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-1.el7.nux.noarch.rpm

yum install vlc smplayer ffmpeg HandBrake-{gui,cli}
#-- usage of below codecs may be legally restricted in some areas. Obtain legal advice if you are uncertain about the laws in your locality.
yum install libdvdcss gstreamer{,1}-plugins-ugly gstreamer-plugins-bad-nonfree gstreamer1-plugins-bad-freeworld

#-- Skype 
yum insall skype

#- Java Applet Support for FireFox
yum install icedtea-web

