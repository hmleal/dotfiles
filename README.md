hmleal dotfiles
===============

This repo is mostly for me but you're welcome to make suggestions. Enjoy :)

Getting started
---------------

### Requirements

1. Install Vim-Plug

  ```sh
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  ```

  See details in [Vim-Plug repository](https://github.com/junegunn/vim-plug).

1. Git config

  ```sh
  $ git config --global user.name  "John Doe"
  $ git config --global user.email "johndoe@example.com"
  $ git config --global core.excludesfile ~/.gitignore
  ```

### Install

1. Just clone repository in your home directory.

  ```sh
  $ git clone https://github.com/hmleal/dotfiles.git ~/.dotfiles
  ```

2. Create symbolic links

  ```sh
  $ ln -s ~/.dotfiles/vimrc ~/.vimrc
  $ ln -s ~/.dotfiles/gitignore ~/.gitignore
  ```

### Install plugins

Open VIM and run `:PlugInstall`.

### Commands

Commands | Descriptions
--- | ---
`F2` | Open three navegate in actual opened file
`F3` | Open/Close three navegate files
`F4` | List all class and method, support for python, go, lua, ruby and php
`F5` | Change between light or dark version of solarized colorscheme
`<leader>Space` | Clean last search highlight
`<leader>m` | Next tab navigate
`<leader>n` | Previous tab navigate
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
