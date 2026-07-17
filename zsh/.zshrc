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
