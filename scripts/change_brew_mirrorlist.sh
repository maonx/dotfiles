#!/usr/bin/env bash

#切换为国内中科大的更新源
cd /usr/local
git remote set-url origin http://mirrors.ustc.edu.cn/homebrew.git

cd ~
mkdir tmp
cd tmp
git clone http://mirrors.ustc.edu.cn/homebrew.git

#备份原目录
sudo mv /usr/local/.git /usr/local/.git_old
sudo mv  /usr/local/Library /usr/local/Library_old
sudo cp -R homebrew/.git /usr/local/
sudo cp -R homebrew/Library /usr/local/

#确保目录归属管理组
sudo chgrp -R admin /usr/local
#确保管理组可读
sudo chmod -R g+w /usr/local

cd /usr/local
sudo git fetch origin
sudo git reset --hard origin/master

brew link `brew list`
brew update && brew upgrade
