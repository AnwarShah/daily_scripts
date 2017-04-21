cat > Release <<EOF
Archive: Xenial
Origin: Ubuntu
Suite: ubuntu-local
Label: Local Ubuntu Repository
Architecture: amd64 i386
EOF
apt-ftparchive --sha1=no --md5=no release . >> Release
gpg --yes -abs -o Release.gpg Release
