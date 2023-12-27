# -*- Mode: shell-script; tab-width: 2; indent-tabs-mode: nil; -*-
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
#ZSH_THEME="candy"
#ZSH_THEME="pygmalion"
#ZSH_THEME="refined"

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
plugins=(tig git autojump sudo colored-man-pages emacs colorize cp history adb ant encode64 extract zsh-syntax-highlighting zsh-256color zsh-autosuggestions urltools python)


# zsh-autosuggestions
# bindkey '^G' autosuggest-execute
#
#export TERM="xterm-256color"

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey "${key[Down]}" down-line-or-beginning-search

source $ZSH/oh-my-zsh.sh

set -o emacs
#set -o KSH_AUTOLOAD

fpath=( ~/.zsh_funcs $fpath )
autoload f vl ws tb

# Customize to your needs...
#export CONFIG_PATH=$PATH:/home/jiazhang/bin:/usr/local/bin:/usr/bin:/bin:/usr/games

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
gitkit () {
    gitfunc -k${1}
}
alias gk="gitkit"
alias gg="gitfunc -g"
alias gadd="gitfunc -a"
glas() {
    git log --pretty=format:"%Cblue%h %<(20,trunc)%Cgreen%an%Creset %s"
}

#eval $(dircolors ~/config/dircolors-solarized/dircolors.ansi-universal)

#export ZSH_AUTOSUGGEST_HIGHLIGHT_COLOR="fg=8"
export TERM="xterm-256color"
export COLORTERM="truecolor"

alias ping="ping -c 5"
alias ipe="curl ipinfo.io/ip"
alias awk1="awk '{print \$1}'"
alias awk2="awk '{print \$2}'"

export EDITOR=/usr/bin/vi

#export PATH=$PATH:$(go env GOPATH)/bin:$NEXUS_HOME/current/bin:$ARCHIVA_HOME/bin:$HOME/.local/bin

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
#zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
#zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
#zstyle ':fzf-tab:*' switch-group ',' '.'
########################################################################################
# Use ~~ as the trigger sequence instead of the default **
#export FZF_COMPLETION_TRIGGER='~~'

# Options to fzf command
export FZF_COMPLETION_OPTS='--border --info=inline'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --info=inline'

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# (EXPERIMENTAL) Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf "$@" --preview 'tree -C {} | head -200' ;;
    export|unset) fzf "$@" --preview "eval 'echo \$'{}" ;;
    ssh)          fzf "$@" --preview 'dig {}' ;;
    vi)           fzf "$@" --height 100% --layout reverse --preview 'bat --color=always --style=numbers --line-range=:500 {}';;
    *)            fzf "$@" ;;
  esac
}

#alias gcob=gco $(gb | fzf --exact --border --cycle --reverse --height '50%')
gcob() {
  local branches branch
  branches=$(git --no-pager branch -vv) &&
  branch=$(echo "$branches" | fzf +m --exact --border --cycle --reverse --height '50%') &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}
tir() {
  local branches branch
  branches=$(git --no-pager branch -vv) &&
  branch=$(echo "$branches" | fzf +m --exact --border --cycle --reverse --height '50%') &&
  tig $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}
#_fzf_complete_tig() {
#  _fzf_complete --multi --reverse --prompt="doge> " -- "$@" < <(
#    echo very
#    echo wow
#    echo such
#    echo doge
#  )
#}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -e ~/.zshrc_local ] && source ~/.zshrc_local

if [[ $- == *i* ]]; then
    # CTRL-B - Paste the current branch
    git-currentbranch-paste() {
        LBUFFER="$LBUFFER$(git rev-parse --abbrev-ref HEAD)"
        local ret=$?
        zle redisplay
        typeset -f zle-line-init >/dev/null && zle zle-line-init
        return $ret
    }
    zle     -N   git-currentbranch-paste
    bindkey '^B' git-currentbranch-paste
fi
