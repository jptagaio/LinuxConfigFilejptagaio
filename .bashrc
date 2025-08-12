#
# ~/.bashrc
#

DISTRO="$(cat /etc/*-release | grep -w NAME= | cut -d'"' -f 2)"

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
if command -v "meocloud" > /dev/null; then
	alias cloud='meocloud status'
fi
alias v='vim'
if [ "$DISTRO" = "Arch Linux" ]; then
	alias cleanup='/home/jptagaio/git/Bash_Scripts/src/System_Maintenance.sh'
fi
alias tmx='tmux new-session -t jptagaio'
alias mount_share='sudo /home/jptagaio/git/Bash_Scripts/src/mount_nfs.sh'
alias umount_share='sudo /home/jptagaio/git/Bash_Scripts/src/umount_nfs.sh'
if [[ $HOSTNAME == *"Desktop"* ]]; then
	alias vnc_thinkpad='/home/jptagaio/git/Bash_Scripts/src/vnc_ThinkPad.sh'
elif [[ $HOSTNAME == *"ThinkPad"* ]]; then
	alias vnc_ArchDesktop='/home/jptagaio/git/Bash_Scripts/src/vnc_DesktopPC.sh'
fi
if [ -d "/opt/Xilinx/Vivado" ]; then
	alias vivado_start='source /opt/Xilinx/Vivado/2023.1/settings64.sh; vivado &'
fi
alias radio='/home/jptagaio/git/streaming-pt/radio.sh'
alias tv='/home/jptagaio/git/streaming-pt/tv.sh'
alias myvimrc='vim /home/jptagaio/.vimrc'
alias mybashrc='vim /home/jptagaio/.bashrc'
alias mytmuxconf='vim /home/jptagaio/.tmux.conf'
alias ncspot='flatpak run io.github.hrkfdn.ncspot'
alias pdf='firefox'
alias weather='/home/jptagaio/git/Bash_Scripts/src/get_Weather.sh Lisboa'
alias generatewikisite='npx @11ty/eleventy --serve'

# Set default text editor
export EDITOR='vim'
export VISUAL='vim'
export PATH="${PATH}:/var/lib/flatpak/exports/bin:/home/jptagaio/Applications/"
. "$HOME/.cargo/env"

# BASH HISTORY
# Avoid duplicates
export HISTCONTROL=ignoredups:erasedups

# Append history entries
shopt -s histappend

# After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

