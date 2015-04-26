### Aliases

## Global applications
export JAVA_HOME=`/usr/libexec/java_home`
export ANT_HOME=~/tools/apache-ant-1.9.4
export MVN_HOME=~/tools/apache-maven-3.2.3
export VERTX_HOME=~/workspace/tools/vert.x-2.1.2
export SYMFONY__MACHINE__NAME=local
export DOCKER_HOST=tcp://192.168.59.103:2375

## PATH
export PATH=/usr/local/git/bin:/usr/local/bin:/usr/local/mysql/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:/usr/X11/bin::$HOME/.rvm/bin:$ANT_HOME/bin:$MVN_HOME/bin:$HOME/workspace/drupaltools/drush:$VERTX_HOME/bin:$PATH
export EDITOR="vim"

# Open specified files in Sublime Text
# "s ." will open the current directory in Sublime
alias s='subl'

# Color LS
colorflag="-G"
alias ls="command ls ${colorflag}"
alias l="ls -lF ${colorflag}" # all files, in long format
alias ll="ls -laFh ${colorflag}" # all files inc dotfiles, in long format
alias lsd='ls -lF ${colorflag} | grep "^d"' # only directories

alias chrome="/Applications/Google\\ \\Chrome.app/Contents/MacOS/Google\\ \\Chrome"
alias drushsite='drush -l http://local.org.aide.voyages-sncf.com'

# Quicker navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

## Alias shortcuts
alias ggrep="git grep --color -n -P"
alias drupalvsc="ssh drupalvsc@drupalvsc"

## Alias app
alias mongod="mongod --dbpath ~/data/db"

# Shortcuts to my Code folder in my home directory
alias workspace="cd ~/workspace"

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Colored up cat!
# You must install Pygments first - "sudo easy_install Pygments"
alias c='pygmentize -O style=monokai -f console256 -g'

# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups

# Make some commands not show up in history
export HISTIGNORE="vi:ll:ls:ls *:cd:cd -:pwd;exit:date:"

### Prompt Colors
# Modified version of @gf3’s Sexy Bash Prompt
# (https://github.com/gf3/dotfiles)
if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
  export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
  export TERM=xterm-256color
fi


BLACK="\033[01;30m"
BLUE="\[\033[0;34m\]"
LIGHT_BLUE="\[\033[1;36m\]"
RED="\033[0;31m"
LIGHT_RED="\[\033[1;31m\]"
GREEN="\033[1;32m"
LIGHT_GREEN="\[\033[1;32m\]"
YELLOW="\033[1;33m"
LIGHT_YELLOW="\033[0;33m"
PURPLE="\033[1;35m"
WHITE="\033[1;37m"
LIGHT_GRAY="\[\033[0;37m\]"
BOLD=""
RESET="\033[m"

export BLACK
export BLUE
export LIGHT_BLUE
export RED
export LIGHT_RED
export GREEN
export LIGHT_GREEN
export YELLOW
export LIGHT_YELLOW
export PURPLE
export WHITE
export LIGHT_GRAY
export BOLD
export RESET

# Git branch details
function parse_git_dirty() {
  [[ $(git status 2> /dev/null | tail -n1) != *"working directory clean"* ]] && echo "*"
}
function parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

# Change this symbol to something sweet.
# (http://en.wikipedia.org/wiki/Unicode_symbols)
symbol="\[$YELLOW\]λ  "

export PS1="\[${BOLD}${LIGHT_RED}\]\u \[$WHITE\]in \[$LIGHT_GREEN\]\w\[$WHITE\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[$LIGHT_BLUE\]\$(parse_git_branch)\[$WHITE\]\n$symbol\[$RESET\]"
export PS2="\[$ORANGE\]→ \[$RESET\]"

### Misc

# Only show the current directory's name in the tab
export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'


## Ruby
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # This loads RVM into a shell session.

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH
