## Convert ext4 etc fs to btrfs on installed system (F23)

### Convert the anyfs to btrfs
Boot from Live CD then
```
 btrfs-convert  <your_partition_name>
```
Replace your actually partition name with <your_partition_name> in the above command

After above command suceeds, use lsblk to view changes and update /etc/fstab to reflect new UUID of the "/" (and other patitions)

### Update Grub configuration
Assuming new root is mounted at /run/media/liveuser/newdiskroot. All partitions like /boot (on HD) should be mountecd again under this new root.
```
for d in /sys /dev /run /proc ; do mount -v --bind "$d" /run/media/liveuser/newdiskroot"$d" ; done
chroot /run/media/liveuser/newdiskroot
dracut -v --force --regenerate-all
grub2-install /dev/sda
grub2-mkconfig -o /boot/grub2/grub.cfg
```
before running above command make sure all other directories were properly mounted under new root (like "/boot") etc.

Remove the LiveCD and boot from insalation media. You should be btrfs business now!


Ref:
1. http://forums.fedoraforum.org/showthread.php?t=246520
2. https://ask.fedoraproject.org/en/question/31666/how-do-you-install-grub2-on-a-replacement-hard-drive/
