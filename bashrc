# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='mac'
fi

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

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

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

##################################################
#USER-ADDED FUNCTIONS/ALIASES
##################################################
export EDITOR=vim

alias cp='cp -i'
alias rm='rm -i'
alias mv='mv -i'
alias ls='ls -al'
alias grep='grep -n --color'
alias hist="history | grep"
alias clj="java -cp /usr/local/bin/clojure-1.6.0/clojure-1.6.0.jar clojure.main"

alias xrestart="sudo /etc/init.d/gdm restart"
alias hay='find . -name'
alias fanstat='sudo cat /proc/acpi/ibm/fan'

if [[ $platform == 'linux' ]]; then
    export WORKON_HOME="/home/emmett/virtualenvs"
elif [[ $platform == 'mac' ]]; then
    export WORKON_HOME="/Users/emmettbutler/virtualenvs"
fi
export GRAILS_HOME="/opt/grails"
export PYTHONSTARTUP="~/.pythonstartup"

# path modifications
export PATH=$PATH:/usr/lib/postgresql/8.4/bin:/opt/grails/bin:/opt/mongo/bin:/opt/flex/bin
export PATH=$PATH:/home/emmett/tools/storm-0.8.2/bin
export PATH=$PATH:/opt/nodejs/bin
export PATH=$PATH:/sbin
export PATH=$PATH:/opt/apache-maven-3.3.3/bin
export PATH=$PATH:/home/emmett/opt/bin:/opt/bin
export PATH=$PATH:~/opt/bin
export PATH=$PATH:/usr/share/elasticsearch/bin
export PATH=$PATH:/opt/llvm/build/Release+Asserts/bin
export PATH=$PATH:/opt/python-3.4.3/bin
export PATH=$PATH:/opt/python-3.5.0/bin

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib:/home/emmett/anaconda3/lib

export JAVA_HOME="/usr/lib/jvm/default-java/"
export M2_HOME="/opt/apache-maven-3.3.3"

$PS1="\[\033[G\]$PS1"

#print and execute the command at the specified line+1 of the bash history file
#+1 because the numbers that `history` displays are apparently off by one
function histr () {
    cmd=`awk NR==$(($1+1)) /home/emmett/.bash_history`
    echo $cmd
    $cmd
}

alias pconnect='ssh -L 27017:localhost:27017 cogtree@174.143.145.120'
alias hay='find . -name'
alias nes='mednafen'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

source /usr/local/bin/virtualenvwrapper.sh
source ~/liquidprompt/liquidprompt

# don't check cacert
export GIT_SSL_NO_VERIFY=true

alias minify="./build_scripts/assets/compile_manifest.py --csso-path $CSSO_PATH --closure-path $CLOSURE_PATH"
export CSSO_PATH="/usr/local/bin/csso"
export CLOSURE_PATH="/home/emmett/.npm/closure-compiler/0.2.2/package/lib/vendor/compiler.jar"
