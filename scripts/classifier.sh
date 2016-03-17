#!/bin/bash

FLODER=$1
PARAM=$2
if [[ -d "$1" ]]; then
  cd $1
  classifier "$2"
fi
