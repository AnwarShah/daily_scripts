backup_dir="/media/anwar/Data/Software/Linux/Debian_Packages/xenial_new/"
archive_dir="/var/cache/apt/archives"

echo "copying newly updated debs to ... $backup_dir"
cp -u -v $archive_dir/*.deb $backup_dir

# Now update the package index file
cd $backup_dir/
genPackages.sh && genRelease.sh

