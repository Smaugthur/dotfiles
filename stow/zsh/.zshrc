# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi

# aliases
alias vi="nvim"
alias exa="ls"
alias nx="nix-shell"
alias fz="searchfzf" # Function for cd with fzf

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

# Enable FZF mappings
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
export FZF_DEFAULT_COMMAND="fd --hidden --follow --exclude '.git'"
export FZF_ALT_C_COMMAND="fd --hidden --follow --exclude '.git' --type d"
export FZF_DEFAULT_OPTS="
--layout=reverse
--info=inline
--height=80%
--multi
--preview-window=:hidden
--preview '([[ -f {} ]] && (batcat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
--color=fg:#cbccc6,bg:#1f2430,hl:#707a8c
--color=fg+:#707a8c,bg+:#191e2a,hl+:#ffcc66
--color=info:#73d0ff,prompt:#707a8c,pointer:#cbccc6
--color=marker:#73d0ff,spinner:#73d0ff,header:#d4bfff
--bind 'ctrl-u:toggle-preview'
"
function searchfzf() {
    cd $(fd --hidden --follow --exclude '.git' --type d | fzf)
}
