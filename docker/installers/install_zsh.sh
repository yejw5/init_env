#!/bin/bash

apt-get install -y zsh

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

chsh -s $(which zsh)

git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh/zsh-autosuggestions

cat << ZSH_CONFIG_END >> ~/.zshrc
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_CONFIG_END
