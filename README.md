hmleal dotfiles
===============

This repo is mostly for me but you're welcome to make suggestions. Enjoy :)

Getting started
---------------

### Requirements

1. Install Vundle

  ```sh
  $ git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
  ```

  See details in [Vundle repository](https://github.com/gmarik/vundle).

2. Integrating with powerline fonts (ArchLinux resolution)

  ```sh
  $ yaourt ttf-powerline-fonts-git --noconfirm
  ```

  See details in [AUR Packages](https://aur.archlinux.org/packages/ttf-powerline-fonts-git/)

### Install .vimrc

1. Just clone repository in your home directory.

  ```sh
  $ git clone https://github.com/hmleal/dotfiles.git ~/.dotfiles
  ```

2. Create symbolic link to your .vimrc

  ```sh
  $ ln -s ~/.dotfiles/vimrc ~/.vimrc
  ```

### Install plugins

Open VIM and run `:PluginInstall`.

### Commands

Commands | Descriptions
--- | ---
`F2` | Open three navegate in actual opened file
`F3` | Open/Close three navegate files
`F4` | List all class and method, support for python, go, lua, ruby and php
`<leader>Space` | Clean last search highlight
`>` | indent to right
`<` | indent to left

### Python hotkeys

Commands | Descriptions
--- | ---
`SHIFT+k` | Open documentation
`Control+Space` | Autocomplete
`<leader>d` | Go to the Class/Method definition
`<leader>r` | Rename object definition
`<leader>n` | Show where command is usage
