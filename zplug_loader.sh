# ZPlug
export ZPLUG_HOME=${ZSH_HOME}/zplug
source $ZPLUG_HOME/init.zsh

# Oh-my-zsh
zplug "robbyrussell/oh-my-zsh", use:"lib/*.zsh"
zplug "plugins/sudo",   from:oh-my-zsh
zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/cp",   from:oh-my-zsh
zplug "plugins/history",   from:oh-my-zsh
zplug "plugins/extract",   from:oh-my-zsh
zplug "plugins/taskwarrior",   from:oh-my-zsh
zplug "plugins/tmux",   from:oh-my-zsh
zplug "plugins/tmuxinator",   from:oh-my-zsh
zplug "plugins/z",   from:oh-my-zsh
zplug "plugins/jsontools",   from:oh-my-zsh
zplug "plugins/virtualenvwrapper",   from:oh-my-zsh

zplug "zsh-users/zsh-completions", use:src
zplug "zsh-users/zsh-autosuggestions", use:zsh-autosuggestions.zsh
zplug "zsh-users/zsh-syntax-highlighting", use:zsh-syntax-highlighting.zsh
zplug "zsh-users/zsh-history-substring-search"

# Themes
zplug "themes/robbyrussell", from:oh-my-zsh

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi

zplug load