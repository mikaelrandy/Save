# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -lF'
alias la='ls -lA'
alias l='ls -CF'
alias lh='ls -lh'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


## Git integration in prompt
# Colors
NoColor="\033[0m"
Cyan="\033[1;34m"
Green="\033[1;32m"
Red="\033[1;31m"
Yellow="\033[1;33m"

# Chars
RootPrompt="\#"
NonRootPrompt="\$"

# Contextual prompt
prompt() {

    USERNAME=`whoami`
    HOSTNAME=`hostname -s`

    # Change the Window title
    WINDOWTITLE="$USERNAME@$HOSTNAME"
    echo -ne "\033]0;$WINDOWTITLE\007"

    # Change the dynamic prompt
    LEFTPROMPT="\[$Green\]\u@\h":"\[$Cyan\]\w"
    GITSTATUS=$(git status 2>  /dev/null)

    if [ $? -eq 0 ]; then

        echo $GITSTATUS | grep -v "not staged" | grep -v "# Untracked files:" | grep -v "# Changes to be committed:" >  /dev/null 2>&1

        if [ $? -gt 0 ]; then
            LEFTPROMPT=$LEFTPROMPT"\[$Red\]"
        else
            LEFTPROMPT=$LEFTPROMPT"\[$Green\]"
        fi

        BRANCH=`git rev-parse --abbrev-ref HEAD`

        LEFTPROMPT=$LEFTPROMPT" ["$BRANCH"]"
    fi

    if [ $EUID -ne 0 ]; then
        PS1=$LEFTPROMPT"\[$NoColor\] "$NonRootPrompt" "
    else
        PS1=$LEFTPROMPT"\[$NoColor\] "$RootPrompt" "
    fi
}

# Define PROMPT_COMMAND if not already defined (fix: Modifying title on SSH connections)
if [ -z "$PROMPT_COMMAND" ]; then

    case $TERM in
    xterm*)
        PROMPT_COMMAND='printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
    ;;

    screen)
        PROMPT_COMMAND='printf "\033]0;%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
    ;;
    esac
fi

# Main prompt
PROMPT_COMMAND="prompt;$PROMPT_COMMAND"
 
if [ $EUID -ne 0 ]; then
    PS1=$NonRootPrompt" "
else
    PS1=$RootPrompt" "
fi 

