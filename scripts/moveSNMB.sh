#!/bin/bash

snmb="`pwd`"
name="`basename $snmb`"
echo $name
cp2here="$HOME/Documents"
if [[ -d "$snmb/.git" ]]; then
  cp -rf $snmb $cp2here
  cd $snmb
  rm -rf .git .gitignore
  cd assets/css
  rm common.scss
# else
#   cd ..
#   rm -rf $snmb
#   cp -rf $cp2here/$name . 
#   sleep 1
#   cd $name
fi


