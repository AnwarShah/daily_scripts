release_name=$(lsb_release -cs)
backup_dir="/media/anwar/Data/Software/Linux/Debian_Packages/"$release_name"_new/"
archive_dir="/var/cache/apt/archives"

if [ ! -f $backup_dir ];then
    echo "Creating ..." $backup_dir
    mkdir $backup_dir
fi

echo "copying newly updated debs to ... $backup_dir"
cp -u -v $archive_dir/*.deb $backup_dir

# Now update the package index file
cd $backup_dir/
genPackages.sh && genRelease.sh

