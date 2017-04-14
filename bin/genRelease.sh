cat > Release <<EOF
Archive: Xenial
Origin: Ubuntu
Suite: ubuntu-local
Label: Local Ubuntu Repository
Architecture: amd64 i386
EOF
apt-ftparchive release . >> Release
gpg -abs -o -y Release.gpg Release
