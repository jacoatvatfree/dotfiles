# .dotfiles

This repository contains my configuraion files. It helps me configure my Mac to get productive fast.

## Requirements

The following tools are required to get the best out of this configuration.

| Name                                                                       | Install Command                                                                                                |
| -------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| [direnv](https://direnv.net/)                                              | `brew install direnv`                                                                                          |
| [ripgrep](https://github.com/BurntSushi/ripgrep)                           | `brew install ripgrep`                                                                                         |
| [ITerm2](https://iterm2.com/)                                              | `brew install iterm2`                                                                                          |
| [tmux](https://github.com/tmux/tmux)                                       | `brew install tmux`                                                                                            |
| [NeoVIM](https://neovim.io/)                                               | `brew install neovim`                                                                                          |
| [universal ctags](https://github.com/universal-ctags/ctags)                | `brew install universal-ctags`                                                                                 |
| [starship](https://starship.rs)                                            | `brew install starship`                                                                                        |
| [gh](https://github.com/cli/cli)                                           | `brew install gh`                                                                                              |
| [git removed-branches](https://github.com/nemisj/git-removed-branches)     | `npm install -g git-removed-branches`                                                                          |
| [sdkman](https://github.com/sdkman/sdkman-cli) & java                      | `curl -s "https://get.sdkman.io" \| bash` `sdkman install java 21` `sdkman install maven`                      |
| Ruby 3+                                                                    | `brew install rbenv` <br/> `rbenv install 3.4.4` <br/> `rbenv global 3.4.4`                                    |
| Python 3.13+                                                               | `brew install pyenv` <br/> `pyenv install 3.13.12` <br/> `pyenv global 3.13.12`                                 |

## Setup

1. Clone this repo to your home folder

```bash
git clone git@github.com:productiveme/dotfiles.git ~/.dotfiles
```

2. Run the install script from within the `.dotfiles` folder

```bash
(cd ~/.dotfiles && bash install.sh)
```

The install script will automatically:
- Install Git with XCode command line tools (if not already installed)
- Install Homebrew (if not already installed)
- Install NodeJS with nvm (if not already installed)
- Install Python 3.13+ with pyenv (if not already installed, required for Neovim Mason tools like black and pylint)
- Install tree-sitter CLI (if not already installed, required for Neovim syntax highlighting)
- Install other dependencies via `brew bundle`
- Create symlinks to configuration files

Note: If Git is not installed, the script will prompt you to complete the XCode command line tools installation and run the script again.
