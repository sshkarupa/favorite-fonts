#!/bin/bash

FONTS_DIR=$HOME/.fonts
TMP=$HOME/tmpdir

function die () {
    echo "${@}"
    exit 1
}

cat <<EOF

--------------------------

San Francisco font family & Monaco font with cyrilic support

--------------------------

EOF

# Create font dir if not exists
if [[ ! -e $FONTS_DIR ]]; then
    mkdir $FONTS_DIR || die "Could not make $FONTS_DIR"
fi

# Create tmp dir if not exists
if [[ ! -e $TMP ]]; then
    mkdir $TMP || die "Could not make $TMP"
fi

echo "Downloading fonts..."; echo
git clone https://github.com/sshkarupa/favorite-fonts.git $TMP \
  || die "Fail to download fonts"

for i in $TMP/fonts/*; do
    echo "Instaling $i"; echo
    mv $i $FONTS_DIR || die "Could not install $i"
    echo "Installed $i successfully"; echo
done

# Remove tmp dir
rm -rf $TMP

cat <<EOF

--------------------------
 Fonts installed! Enjoy!
--------------------------

EOF
