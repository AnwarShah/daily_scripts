# mount the squashfs images of deb repos
sqfsdir=/media/anwar/Software/Linux/Deb_Binaries

#squashfuse -o allow_other $sqfsdir/xenial.squashfs  /mnt/xenial
#squashfuse -o allow_other $sqfsdir/xenial2.squashfs /mnt/xenial2
#squashfuse -o allow_other $sqfsdir/artful.squashfs  /mnt/artful
#squashfuse -o allow_other $sqfsdir/zesty.squashfs   /mnt/zesty

for img in {xenial,xenial2,zesty,artful}
do
  udevil mount $sqfsdir/$img.squashfs
done
