# first setup loop devices and read the loop device names
udisksctl loop-setup --file /mnt/shared/Papirus.iso
udisksctl loop-setup --file /mnt/shared/Hedera.img

# Get the associated loop devices
hedera_loop=$(losetup | grep "/mnt/shared/Hedera.img" | cut -d ' ' -f 1 | head -n 1)
papirus_loop=$(losetup | grep "/mnt/shared/Papirus.iso" | cut -d ' ' -f 1 | head -n 1)

# Now if the loops aren't mounted automatically, mount them
if [ -z $(mount | grep -o $papirus_loop) ]; then
  udisksctl mount --block-device $papirus_loop
fi

if [ -z $(mount | grep -o $hedera_loop ) ];then
  udisksctl mount --block-device $hedera_loop
fi

if [ -z $(mount | grep -o Zesty) ]; then
  udisksctl mount --block-device /dev/disk/by-label/Zesty
fi
