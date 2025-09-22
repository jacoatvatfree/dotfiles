# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Direnv
eval "$(direnv hook zsh)"

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local nvmrc_path
  nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version
    nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
load-nvmrc

# Android dev
export ANDROID_HOME=$HOME/Library/Android
PATH=$PATH:$ANDROID_HOME/sdk/emulator
PATH=$PATH:$ANDROID_HOME/sdk/tools
PATH=$PATH:$ANDROID_HOME/sdk/tools/bin
PATH=$PATH:$ANDROID_HOME/sdk/platform-tools
PATH=$PATH:$ANDROID_HOME/sdk/cmdline-tools/latest/bin
export ANDROID_SDK_ROOT=${ANDROID_HOME}
export JAVA_HOME=$(/usr/libexec/java_home -v 11)

# Meteor dev
export PATH=$HOME/.meteor:$PATH

# Editor
export EDITOR=nvim

# History
HISTFILE=~/.history
SAVEHIST=1000
setopt appendhistory
setopt sharehistory
setopt incappendhistory

# Key bindings: (find the codes with `cat` and pressing key)
bindkey '^R' history-incremental-search-backward
# alt-right-arrow
bindkey "^[^[[C" forward-word
# alt-left-arrow
bindkey "^[^[[D" backward-word
# delete-key
bindkey "^[[3~" delete-char
# home-key
bindkey "^[[H" beginning-of-line
# end-key
bindkey "^[[F" end-of-line

export LANG=en_US.UTF-8

# Rust
. "$HOME/.cargo/env"

source "$HOME/.alias"
source "$HOME/.private"

eval "$(rbenv init -)"

# Added by LM Studio CLI (lms)
export PATH="$PATH:$HOME/.lmstudio/bin"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/jaco/.lmstudio/bin"
# End of LM Studio CLI section

