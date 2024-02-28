# Neovim

<a href="https://dotfyle.com/shivambegin/neovim"><img src="https://dotfyle.com/shivambegin/neovim/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/shivambegin/neovim"><img src="https://dotfyle.com/shivambegin/neovim/badges/leaderkey?style=flat" /></a>
<a href="https://dotfyle.com/shivambegin/neovim"><img src="https://dotfyle.com/shivambegin/neovim/badges/plugin-manager?style=flat" /></a>

## Installation

Make sure you delete or backup your old neovim configuration to somewhere safe before installing this one.

### Backup linux &MacOS

```bash
# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```

### Backup for Windows

```bash
# required
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak

# optional but recommended
Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak
```

### Linux & MacOS

```bash
git clone https://github.com/shivambegin/Neovim.git ~/.config/nvim
```

### Windows

```bash
git clone https://github.com/shivambegin/Neovim.git $env:LOCALAPPDATA\nvim
```

## Setup

- **Terminal:** Wezterm + Tmux
- **Shell:** Zsh + Starship
- **Editor:** Neovim Nightly
- **Source control:** Git
- **Operating system:** Endavouros
- **Tiling manager :** Hyprland

## Plugins

### bars-and-lines

- [SmiteshP/nvim-navic](https://dotfyle.com/plugins/SmiteshP/nvim-navic)
- [luukvbaal/statuscol.nvim](https://dotfyle.com/plugins/luukvbaal/statuscol.nvim)
- [Bekaboo/dropbar.nvim](https://dotfyle.com/plugins/Bekaboo/dropbar.nvim)

### color

- [folke/twilight.nvim](https://dotfyle.com/plugins/folke/twilight.nvim)
- [NvChad/nvim-colorizer.lua](https://dotfyle.com/plugins/NvChad/nvim-colorizer.lua)

### colorscheme

- [catppuccin/nvim](https://dotfyle.com/plugins/catppuccin/nvim)

### comment

- [folke/todo-comments.nvim](https://dotfyle.com/plugins/folke/todo-comments.nvim)
- [numToStr/Comment.nvim](https://dotfyle.com/plugins/numToStr/Comment.nvim)

### completion

- [Exafunction/codeium.nvim](https://dotfyle.com/plugins/Exafunction/codeium.nvim)
- [hrsh7th/nvim-cmp](https://dotfyle.com/plugins/hrsh7th/nvim-cmp)

### cursorline

- [RRethy/vim-illuminate](https://dotfyle.com/plugins/RRethy/vim-illuminate)
- [yamatsum/nvim-cursorline](https://dotfyle.com/plugins/yamatsum/nvim-cursorline)

### debugging

- [rcarriga/nvim-dap-ui](https://dotfyle.com/plugins/rcarriga/nvim-dap-ui)
- [mfussenegger/nvim-dap](https://dotfyle.com/plugins/mfussenegger/nvim-dap)

### dependency-management

- [vuki656/package-info.nvim](https://dotfyle.com/plugins/vuki656/package-info.nvim)

### diagnostics

- [folke/trouble.nvim](https://dotfyle.com/plugins/folke/trouble.nvim)

### editing-support

- [folke/zen-mode.nvim](https://dotfyle.com/plugins/folke/zen-mode.nvim)
- [nvim-treesitter/nvim-treesitter-context](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter-context)
- [axelvc/template-string.nvim](https://dotfyle.com/plugins/axelvc/template-string.nvim)
- [windwp/nvim-autopairs](https://dotfyle.com/plugins/windwp/nvim-autopairs)
- [windwp/nvim-ts-autotag](https://dotfyle.com/plugins/windwp/nvim-ts-autotag)

### file-explorer

- [stevearc/oil.nvim](https://dotfyle.com/plugins/stevearc/oil.nvim)
- [nvim-neo-tree/neo-tree.nvim](https://dotfyle.com/plugins/nvim-neo-tree/neo-tree.nvim)

### fuzzy-finder

- [nvim-telescope/telescope.nvim](https://dotfyle.com/plugins/nvim-telescope/telescope.nvim)

### game

- [Eandrju/cellular-automaton.nvim](https://dotfyle.com/plugins/Eandrju/cellular-automaton.nvim)

### git

- [lewis6991/gitsigns.nvim](https://dotfyle.com/plugins/lewis6991/gitsigns.nvim)
- [kdheepak/lazygit.nvim](https://dotfyle.com/plugins/kdheepak/lazygit.nvim)

### github

- [fowlie/open-github-repo](https://dotfyle.com/plugins/fowlie/open-github-repo)

### icon

- [ziontee113/icon-picker.nvim](https://dotfyle.com/plugins/ziontee113/icon-picker.nvim)

### indent

- [lukas-reineke/indent-blankline.nvim](https://dotfyle.com/plugins/lukas-reineke/indent-blankline.nvim)

### lsp

- [simrat39/symbols-outline.nvim](https://dotfyle.com/plugins/simrat39/symbols-outline.nvim)
- [nvimtools/none-ls.nvim](https://dotfyle.com/plugins/nvimtools/none-ls.nvim)
- [neovim/nvim-lspconfig](https://dotfyle.com/plugins/neovim/nvim-lspconfig)
- [MaximilianLloyd/tw-values.nvim](https://dotfyle.com/plugins/MaximilianLloyd/tw-values.nvim)
- [smjonas/inc-rename.nvim](https://dotfyle.com/plugins/smjonas/inc-rename.nvim)
- [nvimdev/lspsaga.nvim](https://dotfyle.com/plugins/nvimdev/lspsaga.nvim)

### lsp-installer

- [williamboman/mason.nvim](https://dotfyle.com/plugins/williamboman/mason.nvim)

### markdown-and-latex

- [iamcco/markdown-preview.nvim](https://dotfyle.com/plugins/iamcco/markdown-preview.nvim)

### marks

- [ThePrimeagen/harpoon](https://dotfyle.com/plugins/ThePrimeagen/harpoon)

### media

- [andweeb/presence.nvim](https://dotfyle.com/plugins/andweeb/presence.nvim)

### motion

- [ggandor/leap.nvim](https://dotfyle.com/plugins/ggandor/leap.nvim)
- [folke/flash.nvim](https://dotfyle.com/plugins/folke/flash.nvim)

### note-taking

- [nvim-neorg/neorg](https://dotfyle.com/plugins/nvim-neorg/neorg)

### nvim-dev

- [MunifTanjim/nui.nvim](https://dotfyle.com/plugins/MunifTanjim/nui.nvim)
- [folke/neodev.nvim](https://dotfyle.com/plugins/folke/neodev.nvim)
- [nvim-lua/plenary.nvim](https://dotfyle.com/plugins/nvim-lua/plenary.nvim)

### plugin-manager

- [folke/lazy.nvim](https://dotfyle.com/plugins/folke/lazy.nvim)

### programming-languages-support

- [calops/hmts.nvim](https://dotfyle.com/plugins/calops/hmts.nvim)

### project

- [ahmedkhalf/project.nvim](https://dotfyle.com/plugins/ahmedkhalf/project.nvim)

### scrolling

- [karb94/neoscroll.nvim](https://dotfyle.com/plugins/karb94/neoscroll.nvim)

### search

- [FabianWirth/search.nvim](https://dotfyle.com/plugins/FabianWirth/search.nvim)

### session

- [rmagatti/auto-session](https://dotfyle.com/plugins/rmagatti/auto-session)

### snippet

- [L3MON4D3/LuaSnip](https://dotfyle.com/plugins/L3MON4D3/LuaSnip)

### split-and-window

- [famiu/bufdelete.nvim](https://dotfyle.com/plugins/famiu/bufdelete.nvim)
- [folke/edgy.nvim](https://dotfyle.com/plugins/folke/edgy.nvim)

### statusline

- [nvim-lualine/lualine.nvim](https://dotfyle.com/plugins/nvim-lualine/lualine.nvim)

### syntax

- [kylechui/nvim-surround](https://dotfyle.com/plugins/kylechui/nvim-surround)
- [nvim-treesitter/nvim-treesitter](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter)
- [nvim-treesitter/nvim-treesitter-textobjects](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter-textobjects)

### tabline

- [akinsho/bufferline.nvim](https://dotfyle.com/plugins/akinsho/bufferline.nvim)

### test

- [nvim-neotest/neotest](https://dotfyle.com/plugins/nvim-neotest/neotest)

### utility

- [rcarriga/nvim-notify](https://dotfyle.com/plugins/rcarriga/nvim-notify)
- [stevearc/dressing.nvim](https://dotfyle.com/plugins/stevearc/dressing.nvim)
- [echasnovski/mini.nvim](https://dotfyle.com/plugins/echasnovski/mini.nvim)
- [folke/noice.nvim](https://dotfyle.com/plugins/folke/noice.nvim)

## Language Servers

- bashls
- cssls
- efm
- emmet_ls
- gopls
- graphql
- html
- lua_ls
- matlab_ls
- prismals
- pyright
- svelte
- tailwindcss
- tsserver
- yamlls

---

Author : Shivam Rajput

Email: shivamrajputcse@gmail.com
