alias cli='ncs_cli -u admin'
alias ncs_reset='make -C $CONFDX_DIR/lib/webui/webui-one/ncs reset'
alias tailf='cd ~/dev/git/tailf/'
alias one='cd ${NCS_DIR}/../lib/webui/webui-one'
alias xclip="xclip -selection c"

# alias vim='exec_scmb_expand_args /usr/bin/vim'
# alias vim='~/dev/git/dotfiles/nvim.appimage'
# alias nvim='~/dev/git/dotfiles/nvim.appimage'
alias vim='nvim'
alias dot='cd ~/dev/git/dotfiles'
alias la='ls -la --format single-column'
alias pycli='ipython ~/dev/git/ncs_pycli/ncs_pycli'
alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bashrc'
alias rbashrc='. ~/.bashrc'
alias bashal='vim ~/.bash_aliases'
#alias ,yb='git rev-parse --abbrev-ref HEAD | xargs echo -n | xclip -selection c'
#alias ,ye='git rev-parse --abbrev-ref HEAD | grep -o "ENG-[0-9]\+" | xargs echo -n | xclip -selection c'
alias gfoc='git-fzf-checkout.sh'
alias gfco='git-fzf-checkout.sh'
alias gsr='git-soft-reset-file.sh'
alias jqf='jqf.sh'
alias grh='git reset HEAD~1'
alias beep='paplay /usr/share/sounds/gnome/default/alerts/glass.ogg'

prepare_commit_message() {
    #ENG_STRING=$(git rev-parse --abbrev-ref HEAD | grep -o "ENG-[0-9]\+")
    ENG_STRING=$(git rev-parse --abbrev-ref HEAD | grep -Eo "ENG-[0-9]+|noticket")

    if [[ -z "$ENG_STRING" ]]; then
        echo "Neither ENG-[0-9]+ pattern nor 'noticket' string was found."
        return 1  # or 'exit 1' if it's a script and not a function
    elif [[ "$ENG_STRING" == "noticket" ]]; then
      ENG_STRING="no ticket"

      COMMIT_CMD="gc -m \"$ENG_STRING, webui-one: \""
    else
      COMMIT_CMD="gc -m \"[$ENG_STRING, webui-one] \""
    fi

    # COMMIT_CMD="gc -m \"[$ENG_STRING, webui-one] \""

    READLINE_LINE="$COMMIT_CMD"
    READLINE_POINT=$((${#READLINE_LINE} - 1))
}
bind -x '"\C-x\cm": prepare_commit_message'

yank_branch() {
    git rev-parse --abbrev-ref HEAD | xargs echo -n | xclip -sel c
    echo $(xclip -o)
}
bind -x '"\C-x\yb": yank_branch'

yank_eng_number() {
    git rev-parse --abbrev-ref HEAD | grep -o "ENG-[0-9]\+" | xargs echo -n | xclip -sel c
    echo $(xclip -o)
}
bind -x '"\C-x\ye": yank_eng_number'

append_beep() {
    READLINE_LINE="$READLINE_LINE; beep"
}
bind -x '"\C-b": append_beep'
