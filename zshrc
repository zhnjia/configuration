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
plugins=(git autojump sudo colored-man colorize cp history pj emacs adb ant encode64 extract zsh-syntax-highlighting history-substring-search urltools debian)

source $ZSH/oh-my-zsh.sh

fpath=( ~/.zsh_funcs "${fpath[@]}" )
autoload -Uz f vl ws tb

# enable plugins "pj"
PROJECT_PATHS=(~/workspace/ ~/training/)

set -o emacs

eval `dircolors ~/soft_make/dircolors-solarized-master/dircolors.ansi-universal`

# Customize to your needs...
export CONFIG_PATH=$PATH:/home/jiazhang/bin:/usr/local/bin:/usr/bin:/bin:/usr/games

export CCACHE_DIR=/mnt/temp/CCACHE

export CCACHE_COMPILERCHECK=content
export COMPONENT_BUILD=NO
export ICECC=YES ICECC_PREFIX=$HOME/pkg/icecc

# bindkey -v
bindkey "\eA" history-substring-search-up
bindkey "\eB" history-substring-search-down

# adb functions
autoload -Uz adbfunc
alias al="adbfunc"
alias alc="adbfunc -c"
alias alg="adbfunc -g"
alias alsg="adbfunc -s"
alias aleg="adbfunc -e"
alias adbt="adbfunc -t"

# git fun
autoload -Uz gitfunc
alias gk="gitfun -k"
alias gg="gitfun -g"
alias gadd="gitfun -a"

# emacs
alias em="noglob emacs_cmd"
emacs_cmd () {
    emacs $@ 2> /dev/null &
}

alias ec="noglob emacsclient_gui"
emacsclient_gui () {
    emacsclient -c $@ &
}

[ -e ~/.zshrc_local ] && source ~/.zshrc_local
