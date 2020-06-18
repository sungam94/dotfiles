#############################################################
# Generic configuration that applies to all shells
#############################################################

source ~/.shellvars
source ~/.shellfn
source ~/.shellpaths
source ~/.shellaliases

#############################################################
# my stuff from .bash_profile
#############################################################

export PATH="/usr/local/anaconda3/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/qt/bin:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="/usr/local/opt/qt/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/opt/sqlite/bin:$PATH"

export EA_EDITOR='/usr/local/bin/emacsclient -a "" -c'

# export PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"
# export PYTHONPATH="/usr/local/OpenMesh/build/Build/python:$PYTHONPATH"
# export PYTHONPATH="/usr/local/lib/python2.7/site-packages/vtk:$PYTHONPATH"
# export PYTHONPATH="/usr/local/opt/vtk/lib:/usr/local/opt/vtk/lib/site-packages:/usr/local/opt/vtk/Wrapping/Python:$PYTHONPATH"
# export LD_LIBRARY_PATH="/usr/local/opt/vtk/lib:$LD_LIBRARY_PATH"

export EDITOR=nano
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
# source $(dirname $(gem which colorls))/tab_complete.sh  #in .zshrc

# if [ -f ~/.git-prompt.sh ]; then
#   source ~/.git-prompt.sh
#   export PS1='Geoff[\W]$(__git_ps1 "(%s)"): '
# fi
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
