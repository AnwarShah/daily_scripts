echo -n "What will be the release name? Type and [Enter]: "
read name
title_name=${name[*]^}

cat > Release <<EOF
Archive: $title_name
Origin: Local
Suite: $name-local
Label: Local Ubuntu $title_name Repository
Architecture: amd64 i386
EOF
apt-ftparchive --sha1=no --md5=no release . >> Release
gpg --yes -abs -o Release.gpg Release

