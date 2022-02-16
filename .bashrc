#
# ~/.bashrc
#

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="\u@\h \[\e[32m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[00m\]$ "

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls --color=auto -alF'
alias up='/home/jptagaio/Documents/Bash-Scripts/src/updater_script.sh'
alias df='df -h'
alias v='vim'
alias cleanup=/home/jptagaio/Documents/Bash-Scripts/src/System_Maintenance.sh
alias tmx='tmux new-session -t jptagaio'
#PS1='[\u@\h \W]\$ '

# Set default text editor
export EDITOR='vim'
export VISUAL='vim'
. "$HOME/.cargo/env"
