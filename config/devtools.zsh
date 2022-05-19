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
        eval "$(pyenv init --path)"
    fi
fi

# Rust and cargo
if command -v rustc &>/dev/null; then
    export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
    export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
fi
if command -v cargo &>/dev/null; then
    if [ -e "$HOME/.cargo" ]; then
        export PATH="$HOME/.cargo/bin":$PATH
    fi
fi

# jenv
if [ -e "$HOME/.jenv" ]; then
    export PATH="$HOME/.jenv/bin:$PATH"
    eval "$(jenv init -)"
fi

# rbenv
if [ -e "$HOME/.rbenv" ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init - zsh)"
fi
