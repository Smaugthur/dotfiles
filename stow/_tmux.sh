#/bin/zsh

config_folder=~/.config/tmux

# First be sure the path for config exist
mkdir -p $config_folder
# Stow files
stow -v --dir=./ -t $config_folder tmux
