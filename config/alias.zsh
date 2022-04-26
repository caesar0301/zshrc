# Common
alias rm='rm -i'
alias rmf='rm -rf'
alias cp='cp -i'
alias mv='mv -i'
alias duh="du -hs .[^.]*"
alias em='emacs'
alias grep="grep -n"
alias team="pssh -i -h $HOME/.pssh_hosts"

# Proxy
alias pc="proxychains4 -q"

# Git
alias ga="git add"
alias gb="git branch"
alias gba="git branch -av"
alias gd="git diff"
alias gdc="git diff --cached"
alias ghf="git log --follow -p --"
alias grsh="git reset --soft HEAD^ && git reset --hard HEAD"

# zsh
alias zshrc='${=EDITOR} $HOME/.zshrc'
alias zshd='${=EDITOR} $HOME/.zsh.d/init.zsh'
alias zshld='source $HOME/.zshrc'

# vim
alias vimrc='${=EDITOR} $HOME/.vimrc'
alias vimmc='${=EDITOR} $HOME/.vim_runtime/my_configs/'

# java
alias cfr="java -jar ~/.zsh.d/bin/cfr-0.152.jar"
