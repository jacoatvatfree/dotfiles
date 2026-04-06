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
dotfiles=".alias .bashrc .gitconfig .config/starship.toml .config/nvim .config/tmux .config/ghostty .config/opencode .profile .zshrc .config/git"

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
# Install tree-sitter CLI (required for nvim-treesitter)
#==============
if ! command -v tree-sitter &> /dev/null; then
    echo "Installing tree-sitter CLI..."
    # Source nvm if not already available
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    npm install -g tree-sitter-cli
fi

#==============
# Install OpenCode CLI
#==============
if ! command -v opencode &> /dev/null; then
    echo "Installing OpenCode CLI..."
    # Source nvm if not already available
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    npm install -g opencode-ai
fi

#==============
# Install tmux (if not already installed)
#==============
if ! command -v tmux &> /dev/null; then
    echo "Installing tmux..."
    brew install tmux
fi

#==============
# Install starship (if not already installed)
#==============
if ! command -v starship &> /dev/null; then
    echo "Installing starship..."
    brew install starship
fi

#==============
# Install pyenv (if not already installed)
#==============
if ! command -v pyenv &> /dev/null; then
    echo "Installing pyenv..."
    brew install pyenv
    mkdir -p ~/.local/share/pyenv
fi

#==============
# Install Python 3.13 for nvim Mason tools
#==============
# Source pyenv for this session if not already available
export PYENV_ROOT="$HOME/.local/share/pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv &> /dev/null; then
    eval "$(pyenv init -)"
fi

# Check if Python 3.13+ is installed
PYTHON_VERSION=$(pyenv versions --bare 2>/dev/null | grep -E "^3\.(1[3-9]|[2-9][0-9])" | head -1)

if [ -z "$PYTHON_VERSION" ]; then
    echo "Installing Python 3.13.12 for nvim Mason tools (required for black, pylint, etc.)..."
    pyenv install 3.13.12
    pyenv global 3.13.12
else
    echo "Python 3.13+ already installed: $PYTHON_VERSION"
    # Set global version if not already set
    CURRENT_GLOBAL=$(pyenv global 2>/dev/null)
    if ! echo "$CURRENT_GLOBAL" | grep -qE "^3\.(1[3-9]|[2-9][0-9])"; then
        echo "Setting $PYTHON_VERSION as global Python version..."
        pyenv global "$PYTHON_VERSION"
    fi
fi

#==============
# Install direnv (if not already installed)
#==============
if ! command -v direnv &> /dev/null; then
    echo "Installing direnv..."
    brew install direnv
fi

#==============
# Install rbenv (if not already installed)
#==============
if ! command -v rbenv &> /dev/null; then
    echo "Installing rbenv..."
    brew install rbenv
fi

#==============
# Install Java (if not already installed)
#==============
if ! /usr/libexec/java_home -v 17 &> /dev/null; then
    echo "Installing Java 17..."
    brew install openjdk@17
    sudo ln -sfn "$(brew --prefix)/opt/openjdk@17/libexec/openjdk.jdk" /Library/Java/JavaVirtualMachines/openjdk-17.jdk
fi

#==============
# Install TPM and tmux plugins
#==============
if [ ! -d "$HOME/.config/tmux/plugins/tpm" ]; then
    echo "Installing TPM (Tmux Plugin Manager)..."
    git clone https://github.com/tmux-plugins/tpm "$HOME/.config/tmux/plugins/tpm"
fi

echo "Installing tmux plugins..."
# Install plugins using TPM
"$HOME/.config/tmux/plugins/tpm/bin/install_plugins"

#==============
# Restore iTerm profile
#==============
cp -f "$(pwd)/com.googlecode.iterm2.plist" "$HOME/Library/Preferences/com.googlecode.iterm2.plist"
