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
	exec tmux new-session >/dev/null 2>&1
fi


alias ls='ls --color=auto'
alias ll='ls --color=auto -lF'
alias la='ls --color=auto -alF'
alias lz='lazygit'
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
alias disablegoogleplay='adb shell pm uninstall --user 0 com.android.vending'
alias enablegoogleplay='adb shell cmd package install-existing com.android.vending'
alias get_idf='. $HOME/esp/esp-idf/export.sh'
alias eagle='LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libxcb-dri3.so.0 /opt/eagle-9.6.2/eagle'
alias localAI='koboldcpp-linux-x64-nocuda'
alias contas='libreoffice --calc /home/jptagaio/Documents/Contas/Relatório\ de\ Contas\ 2025.ods &'
alias tercodia='python3 /home/jptagaio/git/Python_Scripts/src/terco_dia.py'
alias musicserver='/home/jptagaio/go/bin/subtonic'
alias poweroff='sudo systemctl poweroff'
alias connectbudsFE='bluetoothctl connect DC:C4:9C:1D:C6:E0'
alias sshRouterMEO='ssh -o HostKeyAlgorithms=+ssh-rsa -c 3des-cbc meo@192.168.1.254'

# Set default text editor
export EDITOR='vim'
export VISUAL='vim'
export PATH="${PATH}:/var/lib/flatpak/exports/bin:/home/jptagaio/Applications/"
. "$HOME/.cargo/env"

export PATH="/home/jptagaio/.local/bin/:/opt/MRS_toolchain/risc_v_embedded_gcc/bin/:/opt/riscv-gnu-toolchain/bin/:${PATH}"
export PATH="/opt/xpack-riscv-toolchain/bin:/home/jptagaio/AppImages/:${PATH}";

# BASH HISTORY
# Avoid duplicates
export HISTCONTROL=ignoredups:erasedups

# Append history entries
shopt -s histappend

# After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

export QSYS_ROOTDIR="/home/jptagaio/altera_lite/25.1std/quartus/sopc_builder/bin"

# Added by Quartus Prime software
export SALT_LICENSE_FILE="$SALT_LICENSE_FILE;/home/jptagaio/.altera.quartus/questa_lic.dat"

# opencode
export PATH=/home/jptagaio/.opencode/bin:$PATH

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
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
