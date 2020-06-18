#!usr/bin/env zsh
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
export TERM="xterm-256color"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# emacs too many open files
ulimit -S -n 2048 # or whatever number you choose


# POWERLEVEL9K_MODE set before loading theme
POWERLEVEL9K_MODE='awesome-fontconfig'

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_beginning"
POWERLEVEL9K_RVM_BACKGROUND="black"
POWERLEVEL9K_RVM_FOREGROUND="249"
POWERLEVEL9K_RVM_VISUAL_IDENTIFIER_COLOR="red"
POWERLEVEL9K_TIME_BACKGROUND="black"
POWERLEVEL9K_TIME_FOREGROUND="249"
POWERLEVEL9K_TIME_FORMAT="\UF43A %D{%H:%M  \UF133  %d.%m.%y}"
POWERLEVEL9K_RVM_BACKGROUND="black"
POWERLEVEL9K_RVM_FOREGROUND="249"
POWERLEVEL9K_RVM_VISUAL_IDENTIFIER_COLOR="red"
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='black'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='green'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='white'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='black'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='black'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='blue'
POWERLEVEL9K_FOLDER_ICON=''
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
POWERLEVEL9K_VCS_UNTRACKED_ICON='\u25CF'
POWERLEVEL9K_VCS_UNSTAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\u2193'
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\u2191'
POWERLEVEL9K_VCS_COMMIT_ICON="\uf417"
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{blue}\u256D\u2500%F{white}"
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="%F{blue}\u2570\uf460%F{white} "
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context os_icon ssh virtualenv root_indicator dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time  status rvm time)


bindkey -v

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


# source ~/.iterm2_shell_integration.`basename $SHELL`
# source ~/.iterm2_shell_integration.zsh   # source in iterm preferences
source /usr/local/bin/virtualenvwrapper.sh


# Customize to your needs...
if which ruby >/dev/null && which gem >/dev/null; then
  PATH=$PATH:$(ruby -r rubygems -e 'puts Gem.user_dir')/bin
  PATH=$PATH:$(ruby -e 'puts Gem.bindir')
fi

# export GEM_HOME=$HOME/.gem
# export GEM_PATH=$HOME/.gem
# export PATH="/home/mag/.gem/ruby/1.9.1/bin:$PATH"
# eval "$(rbenv init -)"
source $(dirname $(gem which colorls))/tab_complete.sh


# PATH
export PATH="/Library/TeX/texbin/:$PATH"
export EDITOR='emacs -w'
# export PYTHONPATH=$PYTHONPATH
export MANPATH="/usr/local/man:$MANPATH"
export PKG_CONFIG_PATH=/usr/local/Cellar/zlib/1.2.11/lib/pkgconfig:/usr/local/lib/pkgconfig:/opt/X11/lib/pkgconfig

# Virtual Environment
# export WORKON_HOME=$HOME/.virtualenvs
# export PROJECT_HOME=$HOME/projects
# source /usr/local/bin/virtualenvwrapper.sh

# Owner
export USER_NAME="mag"

# FileSearch
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }

#mkdir and cd
function mkcd() { mkdir -p "$@" && cd "$_"; }

# Aliases
alias cppcompile='c++ -std=c++11 -stdlib=libc++'
alias lc='colorls -a'
alias gitk='/usr/local/git/bin/gitk'
alias ll='lc -la'
alias subl='sublime'
alias inkscape='python /Users/mag/Documents/_org/inkspcape.py'



# Use emacsimetext for editing config files
alias preztoconfig="emacs ~/.zpreztorc"
alias zshconfig="emacs ~/.zshrc"
# alias envconfig="emacs ~/projects/config/env.sh"

# Syntax Highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH="/usr/local/opt/sphinx-doc/bin:$PATH"
