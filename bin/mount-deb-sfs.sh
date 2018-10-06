# mount the squashfs images of deb repos
sqfsdir=/media/anwar/Software/Linux/Deb_Binaries

for img in {xenial,xenial2,zesty,artful}
do
  udevil mount $sqfsdir/$img.squashfs $sqfsdir/$img/
done
