######################
# User configuration #
######################

# aliases
alias be="bundle exec"
alias g="git"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias p="cd ~/projects"

eval "$(direnv hook zsh)"

eval "$(mise activate zsh)"

eval "$(starship init zsh)"

###################
# zsh packages    #
###################

# brew install zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# brew install zsh-syntax-highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# brew install fzf
source <(fzf --zsh)

######################
# Helper functions   #
######################

# Source private/user-specific configurations if they exist
if [[ -f "$HOME/.config/private/zshrc" ]]; then
  source "$HOME/.config/private/zshrc"
fi

if type brew &>/dev/null; then
  fpath=( $(brew --prefix)/share/zsh/site-functions $fpath )
fi

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/aroos/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

# Auto-completion configuration
# Load complist module to define menuselect keymap
zmodload zsh/complist

# Enable menu selection (Tab/Arrow keys to navigate)
zstyle ':completion:*' menu select

# Color completions (di=directory/blue, ln=symlink/magenta, ex=executable/green)
zstyle ':completion:*' list-colors 'di=34:ln=35:ex=32:*.tar=31:*.zip=31'

# Case-insensitive and partial word matching (e.g. f.b -> foo.bar)
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Bind ESC key to exit the completion menu select immediately
bindkey -M menuselect '^[' send-break



# Added by Antigravity IDE
export PATH="/Users/aroos/.antigravity-ide/antigravity-ide/bin:$PATH"
