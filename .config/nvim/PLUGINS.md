# Neovim Plugins

This document provides a comprehensive overview of all plugins configured in this Neovim setup.

## Core Plugins

### LSP & Language Support

- **[neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)** - Quickstart configurations for Neovim's built-in LSP client
- **[williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)** - Portable package manager for LSP servers, DAP servers, linters, and formatters
- **[williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)** - Bridge between mason.nvim and nvim-lspconfig
- **[WhoIsSethDaniel/mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim)** - Automatic installation of Mason tools
- **[folke/neodev.nvim](https://github.com/folke/neodev.nvim)** - Neovim Lua API development setup with documentation and completion
- **[mfussenegger/nvim-jdtls](https://github.com/mfussenegger/nvim-jdtls)** - Java language server integration
- **[kristijanhusak/vim-js-file-import](https://github.com/kristijanhusak/vim-js-file-import)** - Automatic JavaScript/TypeScript file imports
- **[ludovicchabant/vim-gutentags](https://github.com/ludovicchabant/vim-gutentags)** - Automatic ctags management
- **[antosha417/nvim-lsp-file-operations](https://github.com/antosha417/nvim-lsp-file-operations)** - LSP file operations support

### Completion & Snippets

- **[hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)** - Completion engine providing extensible completion functionality
- **[hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)** - LSP completion source for nvim-cmp
- **[hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer)** - Buffer words completion source
- **[hrsh7th/cmp-path](https://github.com/hrsh7th/cmp-path)** - File system paths completion source
- **[L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip)** - Snippet engine written in Lua
- **[saadparwaiz1/cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)** - LuaSnip completion source for nvim-cmp
- **[rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets)** - Collection of pre-configured snippets for various languages
- **[onsails/lspkind.nvim](https://github.com/onsails/lspkind.nvim)** - VS Code-like pictograms for completion items
- **[github/copilot.vim](https://github.com/github/copilot.vim)** - GitHub Copilot AI pair programmer (currently disabled)

### Treesitter

- **[nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** - Treesitter configurations and abstraction layer providing better syntax highlighting
- **[nvim-treesitter/nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects)** - Syntax-aware text objects, selections, and motions
- **[windwp/nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)** - Auto-close and auto-rename HTML tags using Treesitter
- **[JoosepAlviste/nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring)** - Context-aware comment strings based on cursor location

### Telescope & Fuzzy Finding

- **[nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)** - Highly extendable fuzzy finder for lists, files, and more
- **[nvim-telescope/telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)** - FZF sorter for telescope written in C for better performance
- **[nvim-telescope/telescope-live-grep-args.nvim](https://github.com/nvim-telescope/telescope-live-grep-args.nvim)** - Live grep with arguments support for Telescope
- **[nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)** - Lua utility functions used by many plugins

### Formatting & Linting

- **[stevearc/conform.nvim](https://github.com/stevearc/conform.nvim)** - Lightweight yet powerful formatter with support for multiple formatters per filetype
- **[mfussenegger/nvim-lint](https://github.com/mfussenegger/nvim-lint)** - Asynchronous linter plugin

## UI & Appearance

### Status Line & Buffer Line

- **[nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)** - Fast and configurable statusline written in Lua
- **[akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim)** - Snazzy buffer line with tab integration

### Color Schemes

- **[catppuccin/nvim](https://github.com/catppuccin/nvim)** - Soothing pastel theme for Neovim (currently active)
- **[folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim)** - Clean dark Neovim theme (currently disabled)

### UI Enhancements

- **[nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)** - File type icons for various plugins
- **[echasnovski/mini.icons](https://github.com/echasnovski/mini.icons)** - Icon provider with customizable styles
- **[goolord/alpha-nvim](https://github.com/goolord/alpha-nvim)** - Fast and customizable startup screen
- **[folke/noice.nvim](https://github.com/folke/noice.nvim)** - Experimental UI replacement for messages, cmdline, and popupmenu
- **[rcarriga/nvim-notify](https://github.com/rcarriga/nvim-notify)** - Fancy notification manager
- **[MunifTanjim/nui.nvim](https://github.com/MunifTanjim/nui.nvim)** - UI component library for Neovim
- **[stevearc/dressing.nvim](https://github.com/stevearc/dressing.nvim)** - Improves default vim.ui interfaces with better aesthetics
- **[lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)** - Indentation guides with scope highlighting
- **[f-person/auto-dark-mode.nvim](https://github.com/f-person/auto-dark-mode.nvim)** - Automatic dark mode switching based on system appearance

### Focus & Zen Mode

- **[folke/zen-mode.nvim](https://github.com/folke/zen-mode.nvim)** - Distraction-free coding environment
- **[folke/twilight.nvim](https://github.com/folke/twilight.nvim)** - Dims inactive portions of code using Treesitter

## File Navigation & Management

- **[nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)** - File explorer sidebar with git integration
- **[stevearc/oil.nvim](https://github.com/stevearc/oil.nvim)** - Edit your filesystem like a buffer
- **[ThePrimeagen/harpoon](https://github.com/ThePrimeagen/harpoon)** - Quick file navigation between frequently used files (harpoon2 branch)
- **[christoomey/vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)** - Seamless navigation between vim splits and tmux panes
- **[szw/vim-maximizer](https://github.com/szw/vim-maximizer)** - Toggle maximize/restore current window

## Git Integration

- **[lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)** - Git decorations and hunk operations in sign column
- **[tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)** - Premier Git wrapper for Vim
- **[tpope/vim-rhubarb](https://github.com/tpope/vim-rhubarb)** - GitHub extension for vim-fugitive

## Editing & Text Manipulation

- **[kylechui/nvim-surround](https://github.com/kylechui/nvim-surround)** - Add, delete, and change surroundings (quotes, brackets, tags)
- **[gbprod/substitute.nvim](https://github.com/gbprod/substitute.nvim)** - Enhanced substitute operations with exchange and yank
- **[windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs)** - Autopairs for brackets, quotes, and other paired characters
- **[numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim)** - Smart and powerful commenting with Treesitter integration
- **[ThePrimeagen/refactoring.nvim](https://github.com/ThePrimeagen/refactoring.nvim)** - Refactoring library based on Martin Fowler's book

## Code Navigation & Diagnostics

- **[folke/trouble.nvim](https://github.com/folke/trouble.nvim)** - Pretty list for diagnostics, references, quickfix, and location lists
- **[folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim)** - Highlight and search for TODO, HACK, BUG comments
- **[stevearc/quicker.nvim](https://github.com/stevearc/quicker.nvim)** - Improved quickfix window experience
- **[folke/which-key.nvim](https://github.com/folke/which-key.nvim)** - Displays available keybindings in popup as you type

## Testing & Development

- **[vim-test/vim-test](https://github.com/vim-test/vim-test)** - Test runner wrapper for running tests from within Vim
- **[preservim/vimux](https://github.com/preservim/vimux)** - Interact with tmux from Vim
- **[djoshea/vim-autoread](https://github.com/djoshea/vim-autoread)** - Automatically reload files changed outside of Vim

## Database

- **[kristijanhusak/vim-dadbod-ui](https://github.com/kristijanhusak/vim-dadbod-ui)** - Simple UI for vim-dadbod database interactions
- **[tpope/vim-dadbod](https://github.com/tpope/vim-dadbod)** - Modern database interface for Vim
- **[jacoatvatfree/vim-dadbod-completion](https://github.com/jacoatvatfree/vim-dadbod-completion)** - Database completion for vim-dadbod (custom fork)

## Specialized Tools

### Note Taking

- **[epwalsh/obsidian.nvim](https://github.com/epwalsh/obsidian.nvim)** - Obsidian vault integration for note-taking and knowledge management

### Markdown

- **[iamcco/markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)** - Live markdown preview in browser

### Session Management

- **[rmagatti/auto-session](https://github.com/rmagatti/auto-session)** - Automatic session management and restoration

## Plugin Statistics

- **Total Unique Plugins**: 69
- **Main Plugins**: 42
- **Dependencies**: 27

## Categories Breakdown

- LSP & Language Support: 9 plugins
- Completion & Snippets: 9 plugins
- Treesitter: 4 plugins
- Telescope & Fuzzy Finding: 4 plugins
- UI & Appearance: 13 plugins
- File Navigation: 5 plugins
- Git Integration: 3 plugins
- Editing & Text Manipulation: 5 plugins
- Code Navigation & Diagnostics: 4 plugins
- Formatting & Linting: 2 plugins
- Testing & Development: 3 plugins
- Database: 3 plugins
- Specialized Tools: 3 plugins

---

*Last updated: 2026-03-12*
