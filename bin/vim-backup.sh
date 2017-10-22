#!/bin/bash

cd /mnt/home

VIMDIR="/mnt/xenial/home/anwar/.vim"
BACKUP_FILENAME="vim-$(date +%Y%m%d%k%M%S)" #Year-Month-Day-Hour-Minute-Second

if [ ! -d $VIMDIR ]; then
  echo "Cannot find the directory $VIMDIR. Exiting..."
  return -1
else
  echo "Starting backup of $VIMDIR at $(pwd)"
  tar -cpjf $BACKUP_FILENAME.tar.bz2 --one-file-system $VIMDIR
fi

