# Setup fzf
# ---------

export FZF_DEFAULT_COMMAND='rg --files'
export FZF_ALT_C_OPTS='--layout=default --inline-info'
export FZF_CTRL_R_OPTS='--layout=default --inline-info'
export FZF_CTRL_T_OPTS="--layout=default --inline-info --preview '(bat --style=numbers,changes,header --color=always --theme=Monokai\ Extended\ Light {}) 2> /dev/null | head -500'"

if [[ ! "$PATH" == */home/eolofsso/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/eolofsso/.fzf/bin"
fi

alias gfoc='bash /home/eolofsso/dev/git/dotfiles/bin/git-fzf-geckout.sh'

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/eolofsso/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/eolofsso/.fzf/shell/key-bindings.bash"
