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
cp -r ./splitjoin/plugin/* ./nvim/plugin/
cp -r ./splitjoin/ftplugin/* ./nvim/ftplugin/
cp -r ./splitjoin/autoload/* ./nvim/autoload/
cp -r ./splitjoin/doc/* ./nvim/doc/
#fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ./.fzf
./.fzf/install
#linediff
git clone git://github.com/AndrewRadev/linediff.vim.git ./linediff.vim.git
cp -r ./linediff.vim.git/autoload/* ./nvim/autoload/
cp -r ./linediff.vim.git/doc/* ./nvim/doc/
cp -r ./linediff.vim.git/plugin/* ./nvim/plugin/
#fonts
git clone https://github.com/powerline/fonts.git --depth=1 ./fonts
./fonts/install.sh

# Setup links
ln -sf ~/dev/git/dotfiles/.bashrc ~/.bashrc 
ln -sf ~/dev/git/dotfiles/.bash_aliases ~/.bash_aliases
ln -sf ~/dev/git/dotfiles/bin ~/bin
ln -sf ~/dev/git/dotfiles/.bash-git-prompt ~/.bash-git-prompt
ln -sf ~/dev/git/dotfiles/.scm_breeze ~/.scm_breeze
ln -sf ~/dev/git/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dev/git/dotfiles/.git-prompt-colors.sh ~/.git-prompt-colors.sh

# Patch monokai colors
cp ./monokai.vim ./nvim/plugged/vim-monokai/colors/

source ./.bashrc
