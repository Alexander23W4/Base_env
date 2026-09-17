# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

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
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
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

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

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
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
export NEMU_HOME=/home/wang/InternalDependent_ysyx-workbench/nemu
export AM_HOME=/home/wang/InternalDependent_ysyx-workbench/abstract-machine
export PATH=/usr/lib/ccache:$PATH

export NPC_HOME=/home/wang/InternalDependent_ysyx-workbench/npc
alias note="vim ~/LinuxDev/note.txt"
alias gitflow="sh $HOME/bin/gitflow"
export LC_TIME=C

alias tldr="bash $HOME/bin/tldr"
export NVBOARD_HOME=/home/wang/InternalDependent_ysyx-workbench/nvboard
alias ysyx="firefox https://ysyx.oscc.cc/docs/en/#learning-resources"
export PATH=$PATH:~/InternalDependent_ysyx-workbench/oss-cad-suite/bin
nvboard() {
    code ~/InternalDependent_ysyx-workbench/VerTest/nvbtest_soc ~/InternalDependent_ysyx-workbench/nvboard
    cd ~/InternalDependent_ysyx-workbench/VerTest/nvbtest_soc
}

yosth() {
    bash /home/wang/InternalDependent_ysyx-workbench/sCPU/yosys_syn.sh "$@"    
}

dns() {
    sudo ip link set ens33 up
    sudo dhclient ens33
}

# 涉及架构和 ABI 的核心编译工具（保留 32）
alias rv32gcc="riscv64-linux-gnu-gcc -march=rv32i -mabi=ilp32"
alias rv32g++="riscv64-linux-gnu-g++ -march=rv32i -mabi=ilp32"
alias rv32as="riscv64-linux-gnu-as -march=rv32i -mabi=ilp32"
alias rvld="riscv64-linux-gnu-ld"

# 反汇编与显示（不涉及架构参数，使用简洁命名）
alias rvobjdump="riscv64-linux-gnu-objdump -d -M no-aliases"
alias rvreadelf="riscv64-linux-gnu-readelf"
alias rvnm="riscv64-linux-gnu-nm"
alias rvsize="riscv64-linux-gnu-size"
alias rvstrings="riscv64-linux-gnu-strings"

# 格式转换与管理（不涉及架构参数，使用简洁命名）
alias rvobjcopy="riscv64-linux-gnu-objcopy"
alias rvar="riscv64-linux-gnu-ar"
alias rvranlib="riscv64-linux-gnu-ranlib"
alias rvstrip="riscv64-linux-gnu-strip"

# 辅助与调试工具（不涉及架构参数，使用简洁命名）
alias rvaddr2line="riscv64-linux-gnu-addr2line"
alias rvc++filt="riscv64-linux-gnu-c++filt"
alias rvelfedit="riscv64-linux-gnu-elfedit"


alias py="python3"
export LD_LIBRARY_PATH=/usr/lib64:$LD_LIBRARY_PATH

# ============================================================
# Windows proxy configuration
# ============================================================

PROXY_HOST="192.168.47.1"
PROXY_PORT="7897"


# Enable proxy
proxy_on() {

    # Terminal applications
    export HTTP_PROXY="http://${PROXY_HOST}:${PROXY_PORT}"
    export HTTPS_PROXY="http://${PROXY_HOST}:${PROXY_PORT}"
    export ALL_PROXY="socks5://${PROXY_HOST}:${PROXY_PORT}"

    export http_proxy="$HTTP_PROXY"
    export https_proxy="$HTTPS_PROXY"
    export all_proxy="$ALL_PROXY"

    export NO_PROXY="localhost,127.0.0.1,::1"
    export no_proxy="$NO_PROXY"

    # GNOME system proxy
    gsettings set org.gnome.system.proxy mode 'manual'

    # Disable HTTP proxy in GNOME
    gsettings set org.gnome.system.proxy.http host ''
    gsettings set org.gnome.system.proxy.http port 0

    # Disable HTTPS proxy in GNOME
    gsettings set org.gnome.system.proxy.https host ''
    gsettings set org.gnome.system.proxy.https port 0

    # Configure SOCKS5 proxy
    gsettings set org.gnome.system.proxy.socks host "$PROXY_HOST"
    gsettings set org.gnome.system.proxy.socks port "$PROXY_PORT"

    echo "Proxy enabled"
    echo "HTTP/HTTPS: http://${PROXY_HOST}:${PROXY_PORT}"
    echo "SOCKS5:      socks5://${PROXY_HOST}:${PROXY_PORT}"
    echo "GNOME proxy: enabled"
}


# Disable proxy
proxy_off() {

    # Remove terminal proxy variables
    unset HTTP_PROXY
    unset HTTPS_PROXY
    unset ALL_PROXY

    unset http_proxy
    unset https_proxy
    unset all_proxy

    unset NO_PROXY
    unset no_proxy

    # Disable GNOME system proxy
    gsettings set org.gnome.system.proxy mode 'none'

    echo "Proxy disabled"
    echo "Using default VMware NAT network"
}


# Show proxy status
proxy_status() {

    echo "========================================"
    echo "Terminal proxy"
    echo "========================================"

    echo "HTTP_PROXY=${HTTP_PROXY:-not set}"
    echo "HTTPS_PROXY=${HTTPS_PROXY:-not set}"
    echo "ALL_PROXY=${ALL_PROXY:-not set}"

    echo
    echo "========================================"
    echo "GNOME proxy"
    echo "========================================"

    echo "Mode:"
    gsettings get org.gnome.system.proxy mode

    echo
    echo "SOCKS host:"
    gsettings get org.gnome.system.proxy.socks host

    echo "SOCKS port:"
    gsettings get org.gnome.system.proxy.socks port

    echo "========================================"
}


alias dh="npx @deepseek-ai/dsh web"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
