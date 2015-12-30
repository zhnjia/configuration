#!/bin/bash

cd ~
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
ln -s ~/configuration/zshrc ~/.zshrc
ln -s ~/configuration/zsh_funcs ~/.zsh_funcs
