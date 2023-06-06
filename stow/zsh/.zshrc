# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi

# aliases
alias vi="nvim"
alias exa="ls"

# Enable vi mode
bindkey -v

# Enable autocompletition
zstyle ':completion:*' menu select

# Enable starship powerline
eval "$(starship init zsh)"

# Enable ssh agent
# eval "$(ssh-agent -s)" 

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket" 

# Add Yarn packages to the $PATH.
export PATH="$PATH:/opt/yarn-[version]/bin"
export PATH="$PATH:`yarn global bin`"
