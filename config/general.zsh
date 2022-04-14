# in case of absence
export EDITOR=vim
export PATH=$HOME/bin:$HOME/.local/bin:$PATH

# golang
export GOPATH=${HOME}/go
export PATH=$GOPATH/bin:$PATH
export GO111MODULE=on
export GOPROXY=https://mirrors.aliyun.com/goproxy/,direct

# pyenv
if [ -e "$HOME/.pyenv" ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    if command -v pyenv 1>/dev/null 2>&1; then
        eval "$(pyenv init -)"
    fi
fi

# Rust
if [ -e "$HOME/.cargo" ]; then
    export PATH="$HOME/.cargo/bin":$PATH
    export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
    export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
fi

# jenv
if [ -e "$HOME/.jenv" ]; then
    eval export PATH="${HOME}/.jenv/shims:${PATH}"
    export JENV_SHELL=zsh
    export JENV_LOADED=1
    unset JAVA_HOME
    export JENV_ROOT=$HOME/.jenv
    export PATH=$JENV_ROOT/bin:$PATH
    eval "$(jenv init -)"
    eval "$(jenv enable-plugin export)"
    jenv rehash 2>/dev/null
    jenv() {
        typeset command
        command="$1"
        if [ "$#" -gt 0 ]; then
            shift
        fi

        case "$command" in
        enable-plugin | rehash | shell | shell-options)
            eval $(jenv "sh-$command" "$@")
            ;;
        *)
            command jenv "$command" "$@"
            ;;
        esac
    }
fi
