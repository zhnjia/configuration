# -*- Mode: shell-script; tab-width: 2; indent-tabs-mode: nil; -*-
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
#ZSH_THEME="intheloop"
#ZSH_THEME="pygmalion"
#ZSH_THEME="sammy"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git autojump sudo colored-man emacs colorize cp history adb ant encode64 extract zsh-syntax-highlighting zsh-autosuggestions zsh-history-substring-search urltools zsh-256color debian python)

# zsh-autosuggestions
bindkey '^N' autosuggest-execute

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey "${key[Down]}" down-line-or-beginning-search

source $ZSH/oh-my-zsh.sh

set -o emacs
set -o KSH_AUTOLOAD

fpath=( ~/.zsh_funcs $fpath )
autoload f vl ws tb

# Customize to your needs...
export CONFIG_PATH=$PATH:/home/jiazhang/bin:/usr/local/bin:/usr/bin:/bin:/usr/games

# bindkey -v
# bindkey -M emacs "^P" history-substring-search-up
# bindkey -M emacs "^N" history-substring-search-down

# adb functions
autoload -Uz adbfunc
alias al="adbfunc"
alias alc="adbfunc -c"
alias alg="adbfunc -g"
alias alsg="adbfunc -s"
alias aleg="adbfunc -e"
alias adbt="adbfunc -t"
alias devices="adbfunc -d"

# git fun
autoload -Uz gitfunc
alias gk="gitfunc -k"
alias gg="gitfunc -g"
alias gadd="gitfunc -a"

[ -e ~/.zshrc_local ] && source ~/.zshrc_local

eval $(dircolors ~/configuration/dircolors-solarized/dircolors.ansi-universal)

# zsh-autosuggestions
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
