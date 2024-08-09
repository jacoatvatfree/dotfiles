eval "$(/opt/homebrew/bin/brew shellenv)"
if [ $TERM_PROGRAM != "Apple_Terminal" ]; then
  eval "$(starship init zsh)"
fi
# Partial completion for zsh
autoload -Uz compinit
compinit
# Ensure LANG for tmux icons
export LANG=en_US.utf8

source "$HOME/.profile"
add-zsh-hook chpwd load-nvmrc

source "$HOME"/.alias
source "$HOME"/.private
export PATH=$HOME/.meteor:$PATH

# Auto run and attach tmux
if [ -z "$TMUX" ]; then
    if tmux has-session 2>/dev/null; then
        tmux attach
    else
        tmux
    fi
fi

# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
