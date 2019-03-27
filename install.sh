#!/bin/bash

# Install dependencies
sudo apt-get install cgvg
sudo apt install ruby

./submodules/fzf/install --all
./submodules/scm_breeze/install.sh
python ./submodules/install.py --js-completer

# Setup links
ln -sf ./.bashrc ~/.bashrc 
ln -sf ./.bash_aliases ~/.bash_aliases
ln -sf ./bin ~/bin
ln -sf ./submodules/bash-git-promt ~/.bash-git-prompt
ln -sf ./.gitconfig ~/.gitconfig

# Internal links to submodules
ln -sf ./submodules/YouCompleteMe ./nvim/plugged/YouCompleteMe 
ln -sf ./submodules/splitjoin.vim ./nvim/plugged/splitjoin.vim
cp ./monokai.vim ./nvim/plugged/vim-monokai/colors/

source ~/.bashrc
