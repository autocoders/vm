#!/bin/bash
 
# Credits to:
# - https://gist.github.com/adrienbrault/3775253
 
aptitude -y purge ri
aptitude -y purge installation-report landscape-common wireless-tools wpasupplicant
# Looks like some/all of these packages cause Firefox to puke if removed
#aptitude -y purge libnl1 python-smartpm python-twisted-core
#aptitude -y purge python-twisted-bin python-pexpect python-pycurl python-serial python-gobject python-pam python-openssl
aptitude -y purge smbclient gnome-user-guide samba-common-bin poppler-data hplip-data libsmbclient
 
# Remove APT cache
apt-get clean -y
apt-get autoclean -y
 
# Zero free space to aid VM compression
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
 
# Remove bash history
unset HISTFILE
rm -f /root/.bash_history
rm -f /home/vagrant/.bash_history
 
# Cleanup log files
find /var/log -type f | while read f; do echo -ne '' > $f; done;
 
# Whiteout root
count=`df --sync -kP / | tail -n1 | awk -F ' ' '{print $4}'`;
let count--
dd if=/dev/zero of=/tmp/whitespace bs=1024 count=$count;
rm /tmp/whitespace;

# Whiteout /boot
count=`df --sync -kP /boot | tail -n1 | awk -F ' ' '{print $4}'`;
let count--
dd if=/dev/zero of=/boot/whitespace bs=1024 count=$count;
rm /boot/whitespace;

swappart=`cat /proc/swaps | tail -n1 | awk -F ' ' '{print $1}'`
swapoff $swappart;
dd if=/dev/zero of=$swappart;
mkswap $swappart;
swapon $swappart;