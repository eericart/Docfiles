
function fish_greeting
  bash -c "archey3"
end
set -g theme display_user yes
set -g default_user your_default_username

# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
set fish_theme ocean

# Plugins
set fish_plugins gi git node archlinux bundler django python rails rvm tmux autojump extract localhost

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

#Virtual Fish
. /home/ernest/.config/fish/virtualfish/virtual.fish
set -g VIRTUALFISH_COMPAT_ALIASES

function _venvactivate --on-event virtualenv_did_activate
    echo "The virtualenv \""(basename $VIRTUAL_ENV)"\" was activated"
end

function _venvdeactivate --on-event virtualenv_did_deactivate
    echo "The virtualenv \""(basename $VIRTUAL_ENV)"\" was deactivated"
end

. ~/.config/fish/functions/*

#Export
set -gx PATH $HOME/bin $PATH
set -gx PATH /usr/local/bin $PATH
set -gx PATH $HOME/.local/bin $PATH

#Java
set JAVA_HOME /opt/java
set -gx PATH $JAVA_HOME/bin $PATH

# Make default editor
set --export EDITOR "vim"

# Make usable with git
set --export GIT_EDITOR "vim"

set TERM screen-256color
setenv -x GREP_OPTIONS "--color=auto"

set -gx MOZ_PLUGIN_PATH "/usr/lib/mozilla/plugins"

set CDPATH . \
            /media/ernest/Datos/ \
           /home/ernest