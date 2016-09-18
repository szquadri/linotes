
firewall-cmd --set-default-zone=drop

# should have the following stuff to make dev happy
dnf install wget mc strace lsof sysstat dstat hdparm htop iftop atop nc socat mtr jwhois mutt elinks perf iperf iptraf httpry psacct powertop tmux screen pgpdump -y
dnf install virt-manager libvirt-daemon-lxc libvirt-daemon-config-network -y

# ccid authentication
dnf install gnupg2-smime  pcsc-tools opensc pcsc-lite-ccid -y

# - add "auth required pam_google_authenticator.so" (w/o quotes as a line) to /etc/pam.d/gdm-password file
# - insert line just after all "auth" lines. To configure a user run "google-authenticator" as that user
dnf install google-authenticator -y

# "Tweak Tool" for setting like do not suspend when laptop lid is closed
dnf install wodim xbacklight lm_sensors usbguard samba-client smartmontools portecle wireshark-gnome nautilus-open-terminal dconf-editor gnome-tweak-tool gitk gitg -y

# -- java dev
dnf install java-1.8.0-openjdk-devel postgresql-server pgadmin3 mysql-server -y

#android dev
dnf install glibc.i686 glibc-devel.i686 libstdc++.i686 zlib-devel.i686 ncurses-devel.i686 libX11-devel.i686 libXrender.i686 libXrandr.i686 -y

#-- system dev. edb - excellent binary/asm debugger/viwer
dnf install gcc gdb edb git ncurses-devel autoconf automake libtool -y

# desktop use stuff
dnf install gimp gnome-maps simple-scan hplip-gui bleachbit openscap-scanner scap-workbench scap-security-guide -y

# disable tracker and remote its db as we don't need it
gsettings set org.freedesktop.Tracker.Miner.Files crawling-interval -2
gsettings set org.freedesktop.Tracker.Miner.Files enable-monitors false
tracker-control -r


