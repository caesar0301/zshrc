# zsh.d

This repo holds a bunch of zsh predefines configs and plugins as managed by [zplug](https://github.com/zplug/zplug).

## Install

```bash
git clone --recursive https://github.com/caesar0301/zsh.d.git ~/.zsh.d
cp ~/.zsh.d/default.zshrc ~/.zshrc
```

### Change default shell

```bash
# On Linux:

chsh --shell=$(which zsh) $USER

# On Mac OS X:

chsh -s /bin/zsh $USER
```

## Custom

You may or surely have self-customized settings as previously located at `.zshrc`. With this repo, `~/.zsh.d/my_profile` or `~/.zsh.d/.profile` or `~/.zsh.d/.zprofile` is preferred (as ignored by git) without messing up predefined modules.

## Dev

All plugins and my daily modules are configured in `zplug_loader.zsh`.
