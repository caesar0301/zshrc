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
    export PATH="$HOME/.jenv/bin:$PATH"
    eval "$(jenv init -)"
fi
