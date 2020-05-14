#!/bin/bash
TEXINFO_VER=4.13
BUILD_DIR=/tmp

TEXTINFO_FILE="texinfo-$TEXINFO_VER.tar.gz"

cd $BUILD_DIR

wget "http://ftp.gnu.org/gnu/texinfo/$TEXTINFO_FILE"
tar -xvf "$TEXTINFO_FILE"
cd "texinfo-$TEXINFO_VER"

./configure
make -j
make install

cd ..
rm -rf "texinfo-$TEXINFO_VER"