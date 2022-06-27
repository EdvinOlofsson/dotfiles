#!/bin/bash

# Install dependencies
sudo apt-get install cgvg
sudo apt install ruby
sudo apt install git
sudo apt install keychain
sudo apt install curl
sudo apt install make cmake
sudo apt install build-essential python3-dev
sudo apt install nodejs
sudo apt install npm
sudo apt install tmux


# Install dependencies for cisco vpn
# pip install openconnect-sso
# pip install PyQtWebEngine

# NeoVim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage

# Vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Bash Git Prompt
git clone https://github.com/magicmonty/bash-git-prompt.git ./.bash-git-prompt --depth=1
# SCM_Breeze
git clone git://github.com/scmbreeze/scm_breeze.git ./.scm_breeze
./.scm_breeze/install.sh
# nvim config
mkdir ~/.config/nvim
ln -sf ~/dev/git/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -sf ~/dev/git/dotfiles/nvim/treesitter.lua ~/.config/nvim/treesitter.lua
ln -sf ~/dev/git/dotfiles/nvim/plugged ~/.config/nvim/plugged
ln -sf ~/dev/git/dotfiles/nvim/plugin ~/.config/nvim/plugin
ln -sf ~/dev/git/dotfiles/nvim/ftplugin ~/.config/nvim/ftplugin
ln -sf ~/dev/git/dotfiles/nvim/doc ~/.config/nvim/doc
ln -sf ~/dev/git/dotfiles/nvim/autoload ~/.config/nvim/autoload
ln -sf ~/dev/git/dotfiles/nvim/UltiSnips ~/.config/nvim/UltiSnips

ln -sf ~/dev/git/dotfiles/.tmux.conf ~/.tmux.conf

# SplitJoin
git clone https://github.com/AndrewRadev/splitjoin.vim.git ./splitjoin
cp -r ./splitjoin/plugin/* ./nvim/plugin/
cp -r ./splitjoin/ftplugin/* ./nvim/ftplugin/
cp -r ./splitjoin/autoload/* ./nvim/autoload/
cp -r ./splitjoin/doc/* ./nvim/doc/
#fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ./.fzf
./.fzf/install
#linediff
git clone https://github.com/AndrewRadev/linediff.vim.git ./linediff.vim.git
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
cp ./gitprompt.sh ./.bash-git-prompt/gitprompt.sh
ln -sf ~/dev/git/dotfiles/.scm_breeze ~/.scm_breeze
ln -sf ~/dev/git/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dev/git/dotfiles/.git-prompt-colors.sh ~/.git-prompt-colors.sh

# Patch monokai colors
cp ./monokai.vim ./nvim/plugged/vim-monokai/colors/

source ./.bashrc
