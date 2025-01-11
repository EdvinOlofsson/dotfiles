#!/bin/bash

sudo add-apt-repository universe

# Install dependencies
sudo apt install -y ruby
sudo apt install -y git
sudo apt install -y keychain
sudo apt install -y curl
sudo apt install -y make cmake
sudo apt install -y build-essential
sudo apt install -y tmux
sudo apt install -y ripgrep
sudo apt install -y bat
sudo apt install -y tig
sudo apt install -y jq


# Install dependencies for cisco vpn
# pip install openconnect-sso
# pip install PyQtWebEngine
#

# PyEnv
curl https://pyenv.run | bash
# PyEnv Python dependencies
sudo apt-get install zlib1g-dev libffi-dev libssl-dev \
    libbz2-dev libncurses-dev libreadline-dev libsqlite3-dev \
    liblzma-dev python-tk python3-tk tk-dev python3-pip

pyenv install 3.12

# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
nvm install --lts

# NeoVim
# curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
# chmod u+x nvim.appimage

# ~1 major version behind latest release but gives easy python3 support
sudo apt-get install python3-neovim

# Vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

python3 -m pip install --user --upgrade pynvim
pip install six atlassian-python-api rich jenkins python-jenkins

# Bash Git Prompt
git clone https://github.com/magicmonty/bash-git-prompt.git ./.bash-git-prompt --depth=1
# SCM_Breeze
git clone git://github.com/scmbreeze/scm_breeze.git ./.scm_breeze
./.scm_breeze/install.sh

# nvim confibg
mkdir -p ~/.config/nvim
ln -sf ~/dev/git/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -sf ~/dev/git/dotfiles/nvim/treesitter.lua ~/.config/nvim/treesitter.lua
ln -sf ~/dev/git/dotfiles/nvim/plugin ~/.config/nvim/plugin
ln -sf ~/dev/git/dotfiles/nvim/ftplugin ~/.config/nvim/ftplugin
ln -sf ~/dev/git/dotfiles/nvim/doc ~/.config/nvim/doc
ln -sf ~/dev/git/dotfiles/nvim/autoload ~/.config/nvim/autoload
ln -sf ~/dev/git/dotfiles/nvim/UltiSnips ~/.config/nvim/UltiSnips
ln -sf ~/dev/git/dotfiles/nvim/lua ~/.config/nvim/lua

ln -sf ~/dev/git/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dev/git/dotfiles/.tmux ~/.tmux

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
ln -sf ~/dev/git/dotfiles/.tigrc ~/.tigrc

# Patch monokai colors
cp ./monokai.vim ~/.local/share/nvim/plugged/vim-monokai/colors/

source ./.bashrc
