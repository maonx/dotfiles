#!/bin/bash

DOTFILES="$HOME/dotfiles"

# Install vim-plug
if [ ! -f "$HOME/.config/nvim/autoload/plug.vim" ]; then
    curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Install oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# link init.vim
if [ -f "$HOME/.config/nvim/init.vim" ]; then
    mv $HOME/.config/nvim/init.vim $HOME/.config/nvim/init.vim_bak
    ln -s $DOTFILES/config/nvim/init.vim $HOME/.config/nvim/init.vim
fi

# undodirs
if [ ! -d "$HOME/.config/nvim/undodirs" ]; then
    mkdir $HOME/.config/nvim/undodirs
fi

# link .zshrc
if [ -f "$HOME/.zshrc" ]; then
    mv $HOME/.zshrc $HOME/.zshrc_bak
    ln -s $DOTFILES/zshrc $HOME/.zshrc
fi
