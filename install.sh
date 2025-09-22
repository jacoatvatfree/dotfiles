#!/usr/bin/env bash
echo "This script will reset your dotfiles and overwrite any custom settings."
echo "Only run this from within the dotfiles folder. Current folder is $(pwd)."
echo "Press Ctrl-C to cancel or Enter to continue..."
read -sr

#==============
# Install prerequisites if not already installed
#==============

# Check and install Git with XCode command line tools
if ! command -v git &> /dev/null; then
    echo "Installing Git with XCode command line tools..."
    xcode-select --install
    echo "Please complete the XCode command line tools installation and run this script again."
    exit 1
fi

# Check and install Homebrew
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # Add Homebrew to PATH for the current session
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Check and install nvm/NodeJS
if ! command -v nvm &> /dev/null && [ ! -s "$HOME/.nvm/nvm.sh" ]; then
    echo "Installing NodeJS with nvm..."
    PROFILE=/dev/null bash -c 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash'
    # Source nvm for the current session
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    # Install latest LTS Node
    nvm install --lts
    nvm use --lts
fi

mkdir -p "$HOME/.config"
dotfiles=".alias .bashrc .gitconfig .config/starship.toml .config/nvim .config/tmux .config/ghostty .config/opencode .profile .zshrc"

#==============
# Remove old dot flies
#==============
for dotfile in $dotfiles; do
  sudo rm -rf "$HOME"/"$dotfile" > /dev/null 2>&1
done
#==============
# Create symdotfiles in the home folder
# Allow overriding with files of matching names in the custom-configs dir
#==============
SYMLINKS=()
for dotfile in $dotfiles; do
  ln -sf "$(pwd)"/"$dotfile" "$HOME"/"$dotfile"
  SYMLINKS+=("$dotfile")
done

echo "${SYMLINKS[@]}"

touch $HOME/.private

#==============
# Set zsh as the default shell
#==============
chsh -s /bin/zsh

#==============
# Restore iTerm profile
#==============
cp -f "$(pwd)/com.googlecode.iterm2.plist" "$HOME/Library/Preferences/com.googlecode.iterm2.plist"
