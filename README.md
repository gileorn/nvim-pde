# Neovim Personalized Development Environment

![ui overview](./img/overview.png)

## Overview, UI and features

<details>
  <summary>Trouble Neovim plugin for smart code navigation through references and definitions</summary>
  <div>
    <img src="/img/trouble.png"></img>
  </div>
</details>

<details>
  <summary>Diffview Neovim plugin to keep track of all changes</summary>
  <div>
    <img src="/img/diffview.png"></img>
  </div>
</details>

<details>
  <summary>Telescope Neovim plugin to fuzzy-search basically anything</summary>
  <div>
    <img src="/img/telescope.png"></img>
  </div>
</details>

<details>
  <summary>Code Actions Neovim plugin for contextual code actions from LSP</summary>
  <div>
    <img src="/img/code-actions.png"></img>
  </div>
</details>

<details>
  <summary>Which Key Neovim plugin for creating keymaps that stick and make sense</summary>
  <div>
    <img src="/img/which-key.png"></img>
  </div>
</details>

<details>
  <summary>Mason Neovim plugin for LSP package management</summary>
  <div>
    <img src="/img/mason.png"></img>
  </div>
</details>

<details>
  <summary>Lazygit CLI tool as a git wrapper</summary>
  <div>
    <img src="/img/lazygit.png"></img>
  </div>
</details>

<details>
  <summary>Zen Mode with zen-mode Neovim plugin</summary>
  <div>
    <img src="/img/zen-mode.png"></img>
  </div>
</details>

<details>
  <summary>Instance stats with gotop CLI tool</summary>
  <div>
    <img src="/img/gotop.png"></img>
  </div>
</details>

## The real heroes of this setup

- [neovim](https://github.com/neovim/neovim) and [tmux](https://github.com/tmux/tmux) as a foundation
- [leap](https://github.com/ggandor/leap.nvim) - the thing that makes you forget about the mouse and get wherever you want in just 4 keystrokes
- [harpoon](https://github.com/ThePrimeagen/harpoon) - the only sensible way to use bookmarks and the reason I don't want to use tabs anymore
- [which-key](https://github.com/folke/which-key.nvim) - keymaps that make sense and which you don't need to always remember
- [telescope](https://github.com/nvim-telescope/telescope.nvim) - fuzzy search basically anything you can even imagine
- [trouble](https://github.com/folke/trouble.nvim) - jump across the codebase with smart definitions and references
- [lazygit](https://github.com/jesseduffield/lazygit/tree/master) - git wrapper that makes sense

## Prerequisites

- `tmux`, `neovim`, `lazygit` and `git` should be installed on your system
- Enable `CSI u` in iTerm or alternative option in your terminal of choice. This is required for keymaps like <C-;> to work.

## Plugins list

**Git**

- [gitsigns](https://github.com/lewis6991/gitsigns.nvim) - line indicators with git information (added, deleted, changed)
- [git-blame](https://github.com/f-person/git-blame.nvim) - git blame for the current line
- [diffview](https://github.com/sindrets/diffview.nvim) - see all git changes, view diffs, resolve merge conflicts

**Navigation**

- [leap](https://github.com/ggandor/leap.nvim) - unbelievable way to get wherever you want in the buffer with just 4 keystrokes
- [harpoon](https://github.com/ThePrimeagen/harpoon) - the only sensible way to use bookmarks and the reason I don't want to use tabs anymore
- [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) - convenient file explorer
- [nvim-scrollbar](https://github.com/petertriho/nvim-scrollbar) - scrollbar with search and git integrations
- [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) - navigation between nvim splits and tmux panes

**Utility**

- [lualine](https://github.com/nvim-lualine/lualine.nvim) - statusline for buffers with git integration
- [which-key](https://github.com/folke/which-key.nvim) - keymap manager
- [nvim-notify](https://github.com/rcarriga/nvim-notify) - notifications manager
- [vim-maximizer](https://github.com/szw/vim-maximizer) - to quickly maximize the current split in the buffer
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) - to conveniently change matching wrapping characters
- [nvim-surround](https://github.com/kylechui/nvim-surround/tree/main) - to surround text with special characters
- [toggleterm](https://github.com/akinsho/toggleterm.nvim) - to use CLI tools such as lazygit in a floating terminal in neovim
- [comment](https://github.com/numToStr/Comment.nvim) - smart commenting functionality for different languages
- [packer](https://github.com/wbthomason/packer.nvim) - package manager for neovim
- [catpuccin](https://github.com/catppuccin/nvim) - colorscheme of choice

**Search**

- [telescope](https://github.com/nvim-telescope/telescope.nvim) - fuzzy-search anything
- [nvim-hlslens](https://github.com/kevinhwang91/nvim-hlslens) - improved neovim buffer search
- [spectre](https://github.com/nvim-pack/nvim-spectre) - global find & replace

**LSP**

- [trouble](https://github.com/folke/trouble.nvim) - code navigation through definitions and references
- [mason](https://github.com/williamboman/mason.nvim) - package manager for LSPs and linters
- [lightbulb](https://github.com/kosayoda/nvim-lightbulb) - code actions indicator
- [code-action-menu](https://github.com/weilbith/nvim-code-action-menu) - smart contextual code action menu
- [lspconfig](https://github.com/neovim/nvim-lspconfig) - configuring LSP servers
- [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - enhanced code highlight and analysis for other tools

**Autocompletion & snippets**

- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - completion engine
- [cmp-path](https://github.com/hrsh7th/cmp-path) - autocompletion source for files
- [luasnip](https://github.com/L3MON4D3/LuaSnip) - snippet engine with integration to nvim-cmp
