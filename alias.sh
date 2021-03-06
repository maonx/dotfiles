alias zshconfig="vim ~/.zshrc"
alias zshreload="source ~/.zshrc"
alias npm="npm --registry=https://registry.npm.taobao.org "
alias gitci="git add -A && git commit -m "
alias csswatch="sass --sourcemap=none --watch --no-cache "
alias cssout="sass --sourcemap=none --no-cache "
alias vi="nvim"
# alias addwords="vim ~/.vim/bundle/vimim/plugin/vimim.wubijd.txt"
alias mux="tmuxinator"
alias startTaobaoSDK="sh ~/Documents/taobaoSDK/TAE_SDK/bin/startServer.sh"
alias startSuningSDK="sh ~/Documents/suningSDK/sn_sdk/startServer.sh"
alias cleanZip="zip -r --exclude='*_MACOSX*' --exclude='*.sass-cache*' --exclude='*.DS_Store*' "
alias money-sum="awk -F '|' 'NR>=3{a[\$1]+=\$3;} END { for(i in a) print i \"= \" a[i] \"元\";}' \$HOME/memo/money-record.md"
alias money-record="nvim \$HOME/memo/money-record.md"

