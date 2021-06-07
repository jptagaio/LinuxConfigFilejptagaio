#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls --color=auto -alF'
alias up='sudo pacman -Syyu --noconfirm'
alias df='df -h'
alias v='vim'
alias cleanup=/home/jptagaio/Documents/Bash-Scripts/System_Maintenance.sh
PS1='[\u@\h \W]\$ '

# Set default text editor
export EDITOR='vim'
export VISUAL='vim'
