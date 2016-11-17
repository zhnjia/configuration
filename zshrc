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
#ZSH_THEME="avit"

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
bindkey -M emacs "^P" history-substring-search-up
bindkey -M emacs "^N" history-substring-search-down

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

# emacs
alias em="noglob emacs_cmd"
emacs_cmd () {
    emacs $@ 2> /dev/null &
}

alias ec="noglob emacsclient_gui"
emacsclient_gui () {
    emacsclient -c $@ &
}

alias et="emacsclient -t"

# shortcut
alias -s xlsx="libreoffice --calc"
alias -s xls="libreoffice --calc"
alias -s jpg="eog"
alias -s png="eog"
alias -s pdf="evince"
alias -s html="opera"
alias -s htm="opera"

alias -s xml="et"
alias -s el="et"
alias -s java="et"
alias -s cc="et"
alias -s h="et"
alias -s cpp="et"
alias -s py="et"
alias -s sh="et"
alias -s js="et"


[ -e ~/.zshrc_local ] && source ~/.zshrc_local

eval $(dircolors ~/configuration/dircolors-solarized/dircolors.ansi-universal)

# zsh-autosuggestions
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
