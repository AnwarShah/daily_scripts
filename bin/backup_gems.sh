#!/bin/bash

gems_backup_dir="/media/anwar/Data/Software/RubyGems"
find $HOME/.rvm -follow -iname '*.gem' -type f -exec cp -u -v {} $gems_backup_dir/gems/ \;

# generate index
cd $gems_backup_dir
gem generate_index
cd -
