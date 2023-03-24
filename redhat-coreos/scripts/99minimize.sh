set -ux

dd if=/dev/zero of=/var/home/core/EMPTY bs=1M
rm -f /var/home/core/EMPTY
# Block until the empty file has been removed, otherwise, Packer
# will try to kill the box while the disk is still full and that's bad
sync
sync
sync
