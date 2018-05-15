#############################################################
# Generic configuration that applies to all shells
#############################################################

source ~/.shellvars
source ~/.shellfn
source ~/.shellpaths
source ~/.shellaliases
source ~/.iterm2_shell_integration.`basename $SHELL`
# Private/Proprietary shell aliases (not to be checked into the public repo) :)
#source ~/Dropbox/Private/Boxes/osx/.shellaliases


#############################################################
# my stuff from .bash_profile
#############################################################

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

export PATH="/usr/local/opt/qt/bin:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="/usr/local/opt/qt/bin:$PATH"

#export PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"
export PYTHONPATH="/usr/local/OpenMesh/build/Build/python:$PYTHONPATH"
export PYTHONPATH="/usr/local/lib/python2.7/site-packages/vtk:$PYTHONPATH"
export PYTHONPATH="/usr/local/opt/vtk/lib:/usr/local/opt/vtk/lib/site-packages:/usr/local/opt/vtk/Wrapping/Python:$PYTHONPATH"

export LD_LIBRARY_PATH="/usr/local/opt/vtk/lib:$LD_LIBRARY_PATH"

export EDITOR=nano
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

source $(dirname $(gem which colorls))/tab_complete.sh
alias lc='colorls -a'

alias gitk='/usr/local/git/bin/gitk'
alias ll='lc -la'
alias subl='sublime'


if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
  export PS1='Geoff[\W]$(__git_ps1 "(%s)"): '
fi
