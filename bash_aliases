# alias for bash by: Henrique Leal <hm.leal@hotmail.com>
# Inspiration: https://github.com/paulirish/dotfiles/


# Shortcuts
alias g="git"
alias v="vim"
alias gv=gvim


# Easier navigation: .., ..., ~ and -
alias ..="cd .."
alias cd..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"


# GIT Stuffs
alias ga="git add" #Suggest by Severo
alias gs="git status" #N.B. Overrides ghostscript (probably not important if you don't use it)
alias gd="git diff"
alias gc="git commit"
alias gl="git log --graph --full-history --all --color"
