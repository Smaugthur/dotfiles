# How to use

For an easy way to copy my config files I use [GNU Stow](https://www.gnu.org/software/stow/) , a simlink manager, that creates the right symlinks for every config file in the right place. 

1. Move to the Dotfiles directory
   
   ```bash
   cd ./Dotfiles/stow
   ```

2. Make the scripts executable
   
   ```bash
   chmod -v 777 *.sh
   ```

3. Execute the script of the package you want to setup on your system
   
   ```bash
   ./_<package>.sh
   # Example
   ./_qtile.sh
   ```

**IMPORTANT:** Dotfiles wont be overwritten if they already exist. Make sure you delete them first before execute de script, or else we will be saving those configuration.
