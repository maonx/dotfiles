#!/usr/bin/env bash

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
fi
ln -s $DOTFILES/config/nvim/init.vim $HOME/.config/nvim/init.vim

# undodirs
if [ ! -d "$HOME/.config/nvim/undodirs" ]; then
    mkdir $HOME/.config/nvim/undodirs
fi

# link .zshrc
if [ -f "$HOME/.zshrc" ]; then
    mv $HOME/.zshrc $HOME/.zshrc_bak
fi
ln -s $DOTFILES/zshrc $HOME/.zshrc

# link .tmux.conf
if [ -f "$HOME/.tmux.conf" ]; then
    mv $HOME/.tmux.conf $HOME/.tmux.conf_bak
fi
ln -s $DOTFILES/tmux.conf $HOME/.tmux.conf

# link UltiSnips dir
if [ ! -L "$HOME/.config/nvim/UltiSnips" ]; then
  if [ -d "$HOME/.config/nvim/UltiSnips" ]; then
    if [ ! -d "$HOME/.config/nvim/UltiSnips_bak" ]; then
      mv $HOME/.config/nvim/UltiSnips $HOME/.config/nvim/UltiSnips_bak
    fi
  fi
  ln -s $DOTFILES/config/nvim/UltiSnips $HOME/.config/nvim/UltiSnips
fi


# link termite config
if [ "`uname`" == "Linux" ]; then
  if [ -f "$HOME/.config/termite/config" ]; then
      mv $HOME/.config/termite/config $HOME/.config/termite/config_bak
  fi
  ln -s $DOTFILES/config/termite/config $HOME/.config/termite/config
fi

# link i3 config
if [ "`uname`" == "Linux" ]; then
  if [ -f "$HOME/.config/i3/config" ]; then
      mv $HOME/.config/i3/config $HOME/.config/i3/config_bak
  fi
  ln -s $DOTFILES/config/i3/config $HOME/.config/i3/config
fi

# link i3status config
if [ "`uname`" == "Linux" ]; then
  if [ -f "$HOME/.config/i3status/config" ]; then
      mv $HOME/.config/i3status/config $HOME/.config/i3status/config_bak
  fi
  ln -s $DOTFILES/config/i3status/config $HOME/.config/i3status/config
fi

