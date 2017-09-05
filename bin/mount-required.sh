if [ -z $(mount | grep -o "/mnt/shared/Hedera.img" ) ]; then
  udisksctl loop-setup --file /mnt/shared/Hedera.img
fi

if [ -z $(mount | grep -o "/mnt/shared/Papirus.iso" ) ];then
  udisksctl loop-setup --file /mnt/shared/Papirus.iso
fi

if [ -z $(mount | grep -o Zesty) ]; then
  udisksctl mount --block-device /dev/disk/by-label/Zesty
fi
