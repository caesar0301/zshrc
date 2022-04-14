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

## Dev

All plugins and my daily modules are configured in `zplug_loader.zsh`.
