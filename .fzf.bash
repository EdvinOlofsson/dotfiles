# Setup fzf
# ---------
if [[ ! "$PATH" == */home/eolofsso/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/eolofsso/.fzf/bin"
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS="--layout=reverse --inline-info --preview '(bat --style=numbers,changes,header --color=always --theme=Monokai\ Extended\ Light {}) 2> /dev/null | head -500'"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/eolofsso/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/eolofsso/.fzf/shell/key-bindings.bash"
