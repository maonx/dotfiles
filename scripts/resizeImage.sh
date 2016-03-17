#!/bin/bash

# Resize images' width to 1000px in a floder by imagemagick
FLODER="$HOME/work"
WIDTH=1000
DEST="dest"
SRC="Pictures"
FILES="*.jpg *.png *.bmp *.jpeg"
cd $FLODER
if [[ ! -d "$DEST" ]]; then
  mkdir "$DEST"
fi
touch templist
for i in $FILES; do
  identify -format "%f %w \n" $i >> templist 
done
awk -v val=$WIDTH '$2 > val { print $1 }' templist | xargs -I {}  \
  convert -resize $WIDTH {} dest/{}
awk '{ print $1 }' templist | xargs -I {} mv {} Pictures
rm templist
