alias cli='ncs_cli -u admin'
alias tailf='cd ~/dev/git/tailf/'
alias one='cd ~/dev/git/tailf/lib/webui/webui-one'
alias one65='cd ~/dev/git/confd-6.5/lib/webui/webui-one'
alias one66='cd ~/dev/git/confd-6.6/lib/webui/webui-one'
alias one67='cd ~/dev/git/confd-6.7/lib/webui/webui-one'
alias one68='cd ~/dev/git/confd-6.8/lib/webui/webui-one'
alias one71='cd ~/dev/git/confd-7.1/lib/webui/webui-one'
alias extra='cd ~/dev/git/extra/'
alias mpls='cd ~/dev/git/tailf/examples.ncs/service-provider/mpls-vpn/'
alias prime='cd ~/dev/git/webui-prime/'
alias prime54='cd ~/dev/git/webui-prime5.4/'
alias prime65='cd ~/dev/git/webui-prime6.5/'
alias prime64='cd ~/dev/git/webui-prime6.4/'
alias prime63='cd ~/dev/git/webui-prime6.3/'
alias prime62='cd ~/dev/git/webui-prime6.2/'
alias confd54='cd ~/dev/git/confd-5.4/'
alias confd62='cd ~/dev/git/confd-6.2/'
alias confd63='cd ~/dev/git/confd-6.3/'
alias confd64='cd ~/dev/git/confd-6.4/'
alias confd65='cd ~/dev/git/confd-6.5/'
alias confd66='cd ~/dev/git/confd-6.6/'
alias confd67='cd ~/dev/git/confd-6.7/'
alias dev='cd ~/dev/'
alias la='ls -la'
alias pycli='ipython ~/dev/git/ncs_pycli/ncs_pycli'
alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bashrc'
alias rbashrc='. ~/dev/git/dotfiles/.bashrc'
alias bashal='vim ~/.bash_aliases'
alias tmuxconf='vim ~/.tmux.conf'
alias shuffle='play ~/Downloads/Music/MelbournShuffle.mp3'

myfind() {
    find . -name "$1" | grep "$1"
}
alias f=myfind

#Abbrevation for finding a directory
fdir() {
    find . -name "$1" -type d | grep "$1"
}
alias fd=fdir

#Abbrevation for finding file(-ending)
ffile() {
    find . -name "*.$1" | grep "$1"
}
alias ff=ffile

#Abbrevations for sourcing the most common CONFD/NSO builds
src() {
    if [ $1 = 'tailf' ]; then
        source ~/dev/git/tailf/env.sh
    elif [ $1 = 'trunk' ]; then
        source ~/dev/git/tailf/env.sh
    elif [ $1 = 'prime' ]; then
        source  ~/dev/git/webui-prime/env.sh
    elif [ $1 = 'one' ]; then
        source  ~/dev/git/webui-one/env.sh
    elif [ $1 = '54' ]; then
        source  ~/dev/git/confd-5.4/env.sh
    elif [ $1 = '62' ]; then
        source  ~/dev/git/confd-6.2/env.sh
    elif [ $1 = '63' ]; then
        source  ~/dev/git/confd-6.3/env.sh
    elif [ $1 = '64' ]; then
        source  ~/dev/git/confd-6.4/env.sh
    elif [ $1 = '65' ]; then
        source  ~/dev/git/confd-6.5/env.sh
    elif [ $1 = '66' ]; then
        source  ~/dev/git/confd-6.6/env.sh
    elif [ $1 = '67' ]; then
        source  ~/dev/git/confd-6.7/env.sh
    elif [ $1 = '68' ]; then
        source  ~/dev/git/confd-6.8/env.sh
    elif [ $1 = '71' ]; then
        source  ~/dev/git/confd-7.1/env.sh
    else
        echo "Failed to source $1"
    fi

    echo "which ncs  : $NCS_DIR"
}
alias src=src

#Abbrevation for cg on .js files
cgjs() {
    cg $1 "*.js"
}
alias cgjs=cgjs

#Abbrevation for a beep sound
beeptest() {
    ( \speaker-test --frequency $1 --test sine )&
    pid=$!
    \sleep 0.${2}s
    \kill -9 $pid
}
beepboop() {
    beeptest 800 300 > /dev/null 2>&1 &
    \sleep 0.2s
    beeptest 800 300 > /dev/null 2>&1 &
}
alias beep=beepboop

#Abbrevation for starting an ssh session to repository.tail-f.com
sshrepo() {
    ssh repository.tail-f.com
}
alias sshrepo=sshrepo
