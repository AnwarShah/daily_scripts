# Get the associated loop devices if already looped
hedera_loop=$(losetup | grep "/mnt/shared/Hedera.img" | cut -d ' ' -f 1 | head -n 1)
papirus_loop=$(losetup | grep "/mnt/shared/Papirus.iso" | cut -d ' ' -f 1 | head -n 1)

# associate with loop devices if not already looped
if [ -z $hedera_loop ]; then
  hedera_loop=$(udisksctl loop-setup --file /mnt/shared/Hedera.img | grep -o -e "/dev/loop[0-9]*")
fi

if [ -z $papirus_loop ]; then
  papirus_loop=$(udisksctl loop-setup --file /mnt/shared/Papirus.iso | grep -o -e "/dev/loop[0-9]*")
fi

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
