#
# ~/.bashrc
#

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="\[\033[1;36m\]\u\[\033[1;31m\]@\[\033[1;32m\]\h \[\033[1;35m\]\w \[\033[1;91m\]\$(parse_git_branch)\[\033[1;00m\]$ "

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#Tmux open
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

alias ls='ls --color=auto'
alias ll='ls --color=auto -alF'
alias up='/home/jptagaio/git/Bash_Scripts/src/updater_script.sh'
alias upfw='/home/jptagaio/git/Bash_Scripts/src/update_firmware.sh'
alias df='df -h'
alias cloud='meocloud status'
alias v='vim'
alias cleanup='/home/jptagaio/git/Bash_Scripts/src/System_Maintenance.sh'
alias tmx='tmux new-session -t jptagaio'
alias mount_share='sudo /home/jptagaio/git/Bash_Scripts/src/mount_nfs.sh'
alias umount_share='sudo /home/jptagaio/git/Bash_Scripts/src/umount_nfs.sh'

# Set default text editor
export EDITOR='vim'
export VISUAL='vim'
export PATH="${PATH}:$HOME/.local:$HOME/ti/ccs1220/Code Composer Studio 12.2.0.desktop/:$HOME/.local/bin/"
#. "$HOME/.cargo/env"

# BASH HISTORY
# Avoid duplicates
export HISTCONTROL=ignoredups:erasedups

# Append history entries
shopt -s histappend

# After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"


export QSYS_ROOTDIR="/home/jptagaio/git/quartus-free/pkg/quartus-free-quartus/opt/intelFPGA/21.1/quartus/sopc_builder/bin"

