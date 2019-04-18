#!/bin/bash

# Install dependencies
sudo apt-get install cgvg
sudo apt install ruby
sudo apt install git

# Bash Git Prompt
git clone https://github.com/magicmonty/bash-git-prompt.git ./.bash-git-prompt --depth=1
# SCM_Breeze
git clone git://github.com/scmbreeze/scm_breeze.git ./.scm_breeze
./.scm_breeze/install.sh
# SplitJoin
git clone git://github.com/AndrewRadev/splitjoin.vim.git ./splitjoin
cp ./splitjoin/plugin/* ./nvim/plugin/
cp ./splitjoin/ftplugin/* ./nvim/ftplugin/
cp ./splitjoin/autoload/* ./nvim/autoload/
cp ./splitjoin/doc/* ./nvim/doc/
#fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ./.fzf
./.fzf/install
#linediff
git clone git://github.com/AndrewRadev/linediff.vim.git ./linediff.vim.git
cp ./linediff.vim.git/autoload/* ./nvim/autoload/
cp ./linediff.vim.git/doc/* ./nvim/doc/
cp ./linediff.vim.git/plugin/* ./nvim/plugin/
#fonts
git clone https://github.com/powerline/fonts.git --depth=1 ./fonts
./fonts/install.sh

# Setup links
ln -sf ./.bashrc ~/.bashrc 
ln -sf ./.bash_aliases ~/.bash_aliases
ln -sf ./bin ~/bin
ln -sf ./.bash-git-promt ~/.bash-git-prompt
ln -sf ./.scm_breeze ~/.scm_breeze
ln -sf ./.gitconfig ~/.gitconfig

# Patch monokai colors
cp ./monokai.vim ./nvim/plugged/vim-monokai/colors/

source ~/.bashrc
