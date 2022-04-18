export PATH=/usr/local/opt/python@3.9/libexec/bin:$PATH

# check if pyenv is available
# edit: fixed redirect issue in earlier version
function brew2 {
if which pyenv >/dev/null 2>&1; then
  # assumes default location of brew in `/usr/local/bin/brew`
  /usr/bin/env PATH="${PATH//$(pyenv root)\/shims:/}" HOMEBREW_NO_AUTO_UPDATE=1 /usr/local/bin/brew "$@"
else
  HOMEBREW_NO_AUTO_UPDATE=1 /usr/local/bin/brew "$@"
fi

}
