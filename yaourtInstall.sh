#!/bin/bash

# install cron
yaourt -S --noconfirm --needed dcron

# need this to convert multiple images to pdf
yaourt -S --noconfirm --needed ghostscript
# image tool
yaourt -S --noconfirm --needed imagemagick
