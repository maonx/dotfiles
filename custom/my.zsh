# Add yourself some shortcuts to projects you often work on
# Example:
#
# brainstormr=/Users/robbyrussell/Projects/development/planetargon/brainstormr
#

export TERM=screen-256color
export EDITOR=vim


alias zshconfig="vim ~/.zshrc"
alias zshreload="source ~/.zshrc"
alias npm="npm --registry=https://registry.npm.taobao.org "
alias gitci="git add -A && git commit -m "
alias csswatch="sass --sourcemap=none --watch --no-cache "
alias cssout="sass --sourcemap=none --no-cache "
alias vi="vim"
alias addwords="vim ~/.vim/bundle/vimim/plugin/vimim.wubijd.txt"
alias mux="tmuxinator"


# alias tbsdk="~/Documents/taobaoSDK/TAE_SDK/htdocs"
# alias snsdk="~/Documents/suningSDK/sn_sdk/htdocs"
if [[ "$(uname -s)" = "Cygwin" ]]; then
    alias startSuningSDK="/home/maonx/snSDK/SN_SDK.exe"
    alias startTaobaoSDK="/home/maonx/taobaoSDK/bin/TAE-SDK-Launcher.exe"
elif [[ "$(uname -s)" = "Darwin" ]]; then
    alias startTaobaoSDK="sh ~/Documents/taobaoSDK/TAE_SDK/bin/startServer.sh"
    alias startSuningSDK="sh ~/Documents/suningSDK/sn_sdk/startServer.sh"
    alias cleanZip="zip -r --exclude='*_MACOSX*' --exclude='*.sass-cache*' --exclude='*.DS_Store*' "
    alias playOnlineOrigin="you-get -p /opt/homebrew-cask/Caskroom/vlc/2.2.1/VLC.app/Contents/MacOS/VLC "
    alias playOnlineHD2="you-get --format=hd2 -p /opt/homebrew-cask/Caskroom/vlc/2.2.1/VLC.app/Contents/MacOS/VLC "
fi


plugins=(z git colored-man colorize github pip python brew osx zsh-syntax-highlighting vi-mode zsh-completions tmuxinator)
