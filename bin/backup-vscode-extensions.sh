# Go to /mnt/home first
cd /mnt/home

PKG_DIR="$HOME/.vscode/extensions"
BACKUP_FILE_BASENAME="vscode-extensions-$(date +%Y%m%d)" #YYYYMMDD

if [ ! -d $PKG_DIR ]; then
  echo "Cannot find the directory $PKG_DIR. Exiting..."
  return -1
else
  echo "Starting backup of $PKG_DIR at $(pwd)"
  tar -cpjf $BACKUP_FILE_BASENAME.tar.bz2 --one-file-system $PKG_DIR
  echo "Backup finished successfully."
fi

# Go back to previous dir
cd -
