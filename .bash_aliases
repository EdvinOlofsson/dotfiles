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
alias dot='cd ~/dev/git/dotfiles'
alias la='ls -la'
alias pycli='ipython ~/dev/git/ncs_pycli/ncs_pycli'
alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bashrc'
alias rbashrc='. ~/.bashrc'
alias bashal='vim ~/.bash_aliases'


#Abbrevations for sourcing the most common CONFD/NSO builds
src() {
    if [ $1 = 'release' ]; then
        echo ~/dev/releases/nso-$2/ncsrc
        source ~/dev/releases/nso-$2/ncsrc
    elif [ $1 = 'tailf' ]; then
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
    elif [ $1 = '72' ]; then
        source  ~/dev/git/confd-7.2/env.sh
    elif [ $1 = '73' ]; then
        source  ~/dev/git/confd-7.3/env.sh
    else
        echo "Failed to source $1"
    fi

    echo "which ncs  : $NCS_DIR"
}
alias src=src
