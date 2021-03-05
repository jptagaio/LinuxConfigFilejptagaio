#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export QSYS_ROOTDIR="/home/jptagaio/.cache/yay/quartus-free/pkg/quartus-free-quartus/opt/intelFPGA/20.1/quartus/sopc_builder/bin"

#My custom aliases
alias ll="ls -alF"
alias up="sudo pacman -Syu --noconfirm"
alias df="df -h"
alias v="vim"
alias stm32ide="/opt/st/stm32cubeide_1.5.1/stm32cubeide"
#alias yay = "yay -Syu"

#Add path to exercism
export PATH=~/bin:$PATH

#Set default text editor
export EDITOR='vim'
export VISUAL='vim'
