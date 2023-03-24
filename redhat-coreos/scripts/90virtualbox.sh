set -ux

if [ "$guest_additions_mode" = "disable" ]; then
    exit 0
fi

#
# packages need to install VBGA
#
# yum -y install bzip2 perl kernel-devel-`uname -r` epel-release gcc
# yum -y install dkms

VBOX_VERSION=$(cat /var/home/core/.vbox_version)
cd /tmp
mount -o ro,loop /var/home/core/VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
sh /mnt/VBoxLinuxAdditions.run --nox11
umount /mnt
# rm -rf /var/home/core/VBoxGuestAdditions_*.iso