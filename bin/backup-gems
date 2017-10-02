#!/bin/bash

gems_backup_dir="/mnt/Data/Software/RubyGems/"

if [ -d $gems_backup_dir ]; then
  find $HOME/.rvm -follow -iname '*.gem' -type f -exec cp -u -v {} $gems_backup_dir/gems/ \;
else
  echo "Backup directory doesn't exist at $gems_backup_dir"
  exit -1
fi

# generate index
cd $gems_backup_dir
gem generate_index
cd -
