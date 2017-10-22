# CD to cache dir first
cd ~/.cache

YARN_DIR="yarn" # from ~/.cache/
BACKUP_FILE_BASENAME="yarn-cache"

if [ ! -d $YARN_DIR ]; then
  echo "Cannot find the directory $YARN_DIR. Exiting..."
  return -1
else
  echo "Starting backup from $(pwd)/$YARN_DIR"
  tar -caf /mnt/home/$BACKUP_FILE_BASENAME.tar.gz --one-file-system $YARN_DIR
  echo "Backup finished successfully."
fi

# Go back to previous dir
cd -
