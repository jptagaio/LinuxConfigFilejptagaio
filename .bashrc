#
# ~/.bashrc
#

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="\[\033[1;36m\]\u\[\033[1;31m\]@\[\033[1;32m\]\h \[\033[1;35m\]\w \[\033[1;91m\]\$(parse_git_branch)\[\033[1;00m\]$ "

# If not running interactively, do not do anything
[[ $- != *i* ]] && return

#Tmux open
if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ] && [ -z "${TMUX}" ]; then
	exec tmux new-session -A -s "${USER}" >/dev/null 2>&1
fi


alias ls='ls --color=auto'
alias ll='ls --color=auto -lF'
alias la='ls --color=auto -alF'
alias up='/home/jptagaio/git/Bash_Scripts/src/updater_script.sh'
alias upfw='/home/jptagaio/git/Bash_Scripts/src/update_firmware.sh'
alias df='df -h'
alias cloud='meocloud status'
alias v='vim'
alias cleanup='/home/jptagaio/git/Bash_Scripts/src/System_Maintenance.sh'
alias tmx='tmux new-session -t jptagaio'
alias mount_share='sudo /home/jptagaio/git/Bash_Scripts/src/mount_nfs.sh'
alias umount_share='sudo /home/jptagaio/git/Bash_Scripts/src/umount_nfs.sh'
alias vnc_thinkpad='/home/jptagaio/git/Bash_Scripts/src/vnc_ArchThinkPad.sh'
alias vivado_start='source /opt/Xilinx/Vivado/2023.1/settings64.sh; vivado &'
alias vnc_ArchDesktop='/home/jptagaio/git/Bash_Scripts/src/vnc_ArchDesktop.sh'
alias radio='/home/jptagaio/git/streaming-pt/radio.sh'
alias myvimrc='vim /home/jptagaio/.vimrc'
alias mybashrc='vim /home/jptagaio/.bashrc'
alias mytmuxconf='vim /home/jptagaio/.tmux.conf'

# Set default text editor
export EDITOR='vim'
export VISUAL='vim'
export PATH="${PATH}:$HOME/.local:$HOME/ti/ccs1220/Code Composer Studio 12.2.0.desktop/:$HOME/.local/bin/:/opt/Xilinx"
#. "$HOME/.cargo/env"

# BASH HISTORY
# Avoid duplicates
export HISTCONTROL=ignoredups:erasedups

# Append history entries
shopt -s histappend

# After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

export QSYS_ROOTDIR="/home/jptagaio/.cache/yay/quartus-free/pkg/quartus-free-quartus/opt/intelFPGA/23.1/quartus/sopc_builder/bin"

