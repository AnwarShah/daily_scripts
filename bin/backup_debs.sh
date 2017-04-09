backup_dir="/media/anwar/Data/Software/Linux/Debian_Packages/debs_new/"
archive_dir="/var/cache/apt/archives/"

echo "copying newly updated debs to ... $backup_dir"
cp -u -v $archive_dir/*.deb $backup_dir

echo "deleting deb files in archive..."
sudo rm $archive_dir/*.deb


