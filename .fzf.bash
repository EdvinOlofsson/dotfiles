# Setup fzf
# ---------
if [[ ! "$PATH" == */home/eolofsso/dev/git/dotfiles/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/eolofsso/dev/git/dotfiles/.fzf/bin"
fi

alias gfoc='bash /home/eolofsso/dev/git/dotfiles/bin/git-fzf-geckout.sh'

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/eolofsso/dev/git/dotfiles/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/eolofsso/dev/git/dotfiles/.fzf/shell/key-bindings.bash"
