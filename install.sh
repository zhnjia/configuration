#!/bin/bash

# zsh hightlight
if [[ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]];then
    git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi

# zsh profile
[ -f ~/.zshrc ] && mv ~/.zshrc ~/.zshrc_$(date +%Y%m%d%H%M)
ln -s ~/configuration/zshrc ~/.zshrc

# zsh funcs
[ -f ~/.zsh_funcs ] && mv ~/.zsh_funcs ~/.zsh_funcs_$(date +%Y%m%d%H%M)
ln -s ~/configuration/zsh_funcs ~/.zsh_funcs

# emacs/spacemacs profile
[ -f ~/.spacemacs ] && mv ~/.spacemacs ~/.spacemacs_$(date +%Y%m%d%H%M)
ln -s ~/configuration/spacemacs ~/.spacemacs

# dir colors
if [[ ! -d ./dircolors-solarized ]];then
   git clone https://github.com/seebi/dircolors-solarized.git
fi
