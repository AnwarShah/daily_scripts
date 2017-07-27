#!/bin/bash

cd /mnt/home

VIMDIR="/mnt/xenial/home/anwar/.vim"
BACKUP_FILENAME="vim-$(date +%d%m%Y%k%M%S)" #Day-Month-Year-Hour-Minute-Second

if [ ! -d $VIMDIR ]; then
  echo "Cannot find the directory $VIMDIR. Exiting..."
  return -1
else
  echo "Starting backup of $VIMDIR at $(pwd)"
  tar -cpjf $BACKUP_FILENAME.tar.bz2 --one-file-system $VIMDIR
fi

