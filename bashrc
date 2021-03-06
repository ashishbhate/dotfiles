# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\e[m\]@\[\033[1;33m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \[\033[1;35m\][\t]\[\033[00m\]$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias l='ls -hF'
alias ll='ls -lahF'
#alias la='ls -A'
#alias l='ls -CF'
alias psg='ps aux | grep -i'
alias k9='kill -9'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Custom Keybinds

# Binds Up and Down arrow keys to history search narrowed
# to the partial line already entered (Basically C^r with Up and Down Keys)
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Binds clear screen ctrl+g
bind -x '"\C-g": clear'


## GIT
export PS1=${PS1}'$(__git_ps1 "(%s): ")'
export GIT_PS1_SHOWDIRTYSTATE=1

export GOROOT=$HOME/root/src/go
export GOPATH=$HOME/Code/gocode
export GOBIN=$GOPATH/bin

export NODEBIN=$HOME/root/src/node/bin

# Custom paths
export PATH=$HOME/root/bin:$GOBIN:$GOROOT/bin:$NODEBIN:$PATH
export PATHNOR=$PATH
export PATHARM=/usr/arm-none-eabi/bin:$PATH
export PATHNODE=$HOME/Learning/LearnNode/node-v7.10.0-linux-x64/bin:$PATH
export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_TOOLS=$ANDROID_HOME/tools
export ANDROID_PLATFORM_TOOLS=$ANDROID_HOME/platform-tools
export PATHLEARNREACT=$HOME/Learning/React-Native-Udemy/Software/node-v7.10.0-linux-x64/bin:$ANDROID_TOOLS:$ANDROID_PLATFORM_TOOLS:$PATH
export MANPATH=$HOME/root/share/man:$MANPATH

# Custom aliases
PSN=$PS1
alias envnor='export PATH=$PATHNOR; echo $PATH;export PS1=$PSN;unalias vim'
alias envnode='export PATH=$PATHNODE; echo $PATH; export PS1=$PS1"\[\033[1;31m\]NODE\$ \[\033[00m\]";'
alias envrn='export PATH=$PATHLEARNREACT; echo $PATH; export PS1=$PS1"\[\033[1;31m\]NODE-RN\$ \[\033[00m\]";'
# ARM GCC
alias envarm='export PATH=$PATHARM; echo $PATH; export PS1=$PS1"\[\033[1;31m\]ARM\$ \[\033[00m\]"'

alias todo='vim note:todo'
alias rl='vim note:readinglist'
alias o='/usr/bin/xdg-open'
alias getip='curl https://canihazip.com/s'
alias grep="grep --color"
alias tmux="tmux -2u"
alias pls='sudo $(history -p !!)'
alias up='sudo apt update'
alias ud='sudo apt upgrade'
alias vimpy2='/usr/bin/vim.gtk-py2'
alias nless='less -NR'
alias gad='git add'
alias gcm='git commit'
alias gco='git checkout'
alias gdi='git diff'
alias gdc='git diff --cached'
alias glg='git log'
alias gst='git status'
alias gps='git push'
alias gpl='git pull'
shopt -s autocd


######
#export CDPATH=.:~:~/Enthought/Code
#export CDPATH=.:~

######
# ctrl+w deletes till slash not whitespace
stty werase undef
bind '\C-w:unix-filename-rubout'

COMMAND_NOT_FOUND_AUTO=1

#function limll {
#    limit=${1:-20}
#    ls -l | head -n $limit
#    if [[ ${PIPESTATUS[0]} -ne 0 ]];
#    then
#        echo "$(($(ls -l | wc -l) - $limit)) lines omitted"
#    fi
#}

#function cd {
#    dir="${@:-$HOME}" # ~ does not expand when in quotes
#    if ! builtin cd "$dir"
#    then
#        dir=`compgen -d "${dir}" | head -1`
#        if builtin cd "$dir" &>/dev/null
#        then
#            clear; pwd; limll;
#        fi
#    else
#        clear; pwd; limll;
#    fi
#}

#complete -d cd

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='ag --hidden -f -g ""'

export EDITOR='nvim'



# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
#[ -f /home/ab/Code/open-bot/node_modules/tabtab/.completions/serverless.bash ] && . /home/ab/Code/open-bot/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
#[ -f /home/ab/Code/open-bot/node_modules/tabtab/.completions/sls.bash ] && . /home/ab/Code/open-bot/node_modules/tabtab/.completions/sls.bash
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
#[ -f /home/ab/Code/open-bot/node_modules/tabtab/.completions/slss.bash ] && . /home/ab/Code/open-bot/node_modules/tabtab/.completions/slss.bash
