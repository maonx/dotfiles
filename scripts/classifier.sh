#!/bin/bash

FLODER=$1
PARAM=$2
if [[ -d "$1" ]]; then
  cd $1
  if [[ -n "$2" ]]; then
    classifier "$2"
  else
    classifier 
  fi
fi
