
## PATH
export PATH=/usr/local/mysql/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin:/usr/X11/bin:/usr/local/git/bin:$HOME/.rvm/bin:$PATH
export EDITOR="vim"

## Alias shortcuts
alias ll="ls -alh"
alias ls="ls -FG" # Same as CLICOLOR=true

## Alias applications
export JAVA_HOME="`/usr/libexec/java_home`"
export CDPATH=.:~

## Prompt
export PS1="\n\[\033[1;33m\]\u\[\033[1;31m\]@\[\033[1;33m\]\H\[\033[0m\] \n\[\033[1;31m\]\w\[\033[0m\]\[\033[1;36m\] λ  \[\033[m\]"

## Options
export TERM="xterm-color"
export LSCOLORS=GxFxCxDxBxegedabagaced
export GREP_OPTIONS='--color=auto'

# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups

# Make some commands not show up in history
export HISTIGNORE="vi:ll:ls:ls *:cd:cd -:pwd;exit:date:* --help"

## bash_completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

## Ruby
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # This loads RVM into a shell session.
