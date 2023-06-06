#/bin/zsh

config_folder=~/.config/redshift
package=redshift

# First be sure the path for config exist
mkdir -p $config_folder
# Stow files
stow -v --adopt --dir=./ -t $config_folder $package
