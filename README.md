# dotfiles

My very own dotfiles

## Installation

I separated in "category steps" because some are simpler than others. :grin:

### git

To configure git with this dotfiles it's just `cp .gitconfig ~` and you are done.

### vim

To configure vim is required a little more of work. So follow these steps:

1. Install Vundle ([follow this script](https://github.com/gmarik/Vundle.vim#quick-start))
2. Copy the configurations with the commands:
  1. `cp .vimrc ~`
  2. `cp .Xresources ~`
  3. `cp -R .vim ~`
3. Open vim and execute `:PluginInstall`
