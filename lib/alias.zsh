# Common
alias duh="du -hs .[^.]*"
alias em='emacs'
alias diff='diff -r'

# batch
alias team="pssh -i -h $HOME/.pssh_hosts"

# Proxy
alias pc="proxychains4 -q"

# Git
alias ga="git add"
alias gb="git branch"
alias gba="git branch -av"
alias gd="git diff --ws-error-highlight=all"
alias gdc="git diff --cached"
alias ghf="git log --follow -p --"
alias grsh="git reset --soft HEAD^ && git reset --hard HEAD"
alias gsrh="git submodule foreach --recursive git reset --hard"

# vim
alias vimrc='${=EDITOR} $HOME/.vimrc'
alias vimmc='${=EDITOR} $HOME/.vim_runtime/my_configs.vim'

# java
alias cfr="java -jar ${ZSH_RUNTIME}/bin/cfr-0.152.jar"

# cmake
alias cmake="cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1"

# Perf
alias psmem="ps -o pid,user,%mem,command ax | sort -b -k3 -r"
