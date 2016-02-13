KVM Virtualization


yum install qemu-kvm qemu-img qemu-kvm-tools python-virtinst libvirt libvirt-client virt-top virt-viewer bridge-utils -y
yum install java-1.6.0-openjdk-devel  *guestf* libguestfs-tools -y


chkconfig iptables off
chkconfig NetworkManager off
chkconfig network on
service NetworkManager stop
service network start


vi /etc/sysconfig/network-scripts/ifcfg-eth0
-- edit so it look slike

# device: eth0
DEVICE=eth0
# change the hardware address to match the hardware address your NIC uses
HWADDR=<MAC>
ONBOOT=yes
BOOTPROTO=dhcp
BRIDGE=br0

-- create a new file 
vi /etc/sysconfig/network-scripts/ifcfg-br0

DEVICE=br0
TYPE=Bridge
BOOTPROTO=dhcp
ONBOOT=yes
DELAY=0


-- In /etc/sysctl.conf append the following lines: 
net.bridge.bridge-nf-call-ip6tables=0
net.bridge.bridge-nf-call-iptables=0
net.bridge.bridge-nf-call-arptables=0




--setup forwarding

-- load configuration
sysctl -p /etc/sysctl.conf


-- setup iptables

# service network restart
-- verify bridge. follwing comand should list something like given below
# brctl show
bridge name     bridge id              	 STP enabled     interfaces
virbr0        8000.000000000000       yes
br0	         8000.xxxxyyyzzzzzzz		no			eth0


### Install centos
virt-install \
--name=test \
--disk path=/var/lib/libvirt/images/test.img,size=40,bus=virtio,format=qcow2 \
--vcpus=2 --ram=4096 \
--location=http://isoredirect.centos.org/centos/6/os/x86_64/ \
--network bridge=br0 \
--mac=<DC_GIVEN_MAC> \
--os-type=linux \
--os-variant=rhel6 \
--initrd-inject=/virt/ksmin1.ks \
--extra-args="ks=file:/ksmin1.ks text console=tty0 utf8 console=ttyS0,115200" 


### Install ubuntu
virt-install \
--name ubuntu \
--vcpus=2 --ram=1024 \
--disk path=/var/lib/libvirt/images/ubuntu.img,size=80,bus=virtio,format=qcow2 \
--os-type linux \
--os-variant=ubuntuprecise \
--network bridge=virbr0 \
--location='http://archive.ubuntu.com/ubuntu/dists/precise/main/installer-amd64/' \
--extra-args='console=tty0 console=ttyS0,115200n8 serial'

