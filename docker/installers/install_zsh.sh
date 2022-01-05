#!/bin/bash

apt install zsh

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

chsh -s $(which zsh)

git clone git://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

echo << EOF >> ~/.zshrc
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
EOF
