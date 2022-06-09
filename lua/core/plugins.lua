local fn = vim.fn

local plugins = {
  -- Plugin manager
  ['wbthomason/packer.nvim'] = {},

  -- An implementation of the Popup API from vim in Neovim
  ['nvim-lua/popup.nvim'] = {},

  -- Useful lua functions used ny lots of plugins
  ['nvim-lua/plenary.nvim'] = {module = 'plenary'},

  -- -- Colorscheme
  -- ['folke/tokyonight.nvim'] = {},
  ['sainnhe/everforest'] = {},

  -- Icons
  ['kyazdani42/nvim-web-devicons'] = {
    event = 'VimEnter',
    config = function() require('configs.nvim-web-devicons').config() end,
  },

  -- Better buffer closing
  ['famiu/bufdelete.nvim'] = {cmd = {'Bdelete', 'Bwipeout'}},

  -- File explorer
  ['kyazdani42/nvim-tree.lua'] = {
    cmd = 'NvimTreeToggle',
    requires = {'kyazdani42/nvim-web-devicons'},
    config = function() require('configs.nvim-tree').config() end,
  },

  -- Built-in LSP
  ['neovim/nvim-lspconfig'] = {event = 'VimEnter'},

  -- LSP installer
  ['williamboman/nvim-lsp-installer'] = {
    after = 'nvim-lspconfig',
    config = function()
      require('configs.lsp.lsp-installer')
      require('configs.lsp').config()
    end,
  },

  -- Formattign and Linting
  ['jose-elias-alvarez/null-ls.nvim'] = {
    event = {'BufRead', 'BufNewFile'},
    config = function() require('configs.null-ls').config() end,
  },

  -- Fuzzy finder
  ['nvim-telescope/telescope.nvim'] = {
    cmd = 'Telescope',
    module = 'telescope',
    config = function() require('configs.telescope').config() end,
  },

  -- Fuzzy finder syntax support
  ['nvim-telescope/telescope-fzf-native.nvim'] = {
    after = 'telescope.nvim',
    run = 'make',
    config = function() require('telescope').load_extension 'fzf' end,
  },

  -- Auto close tag
  ['windwp/nvim-ts-autotag'] = {after = 'nvim-treesitter'},

  -- Conetxt based commenting
  ['JoosepAlviste/nvim-ts-context-commentstring'] = {after = 'nvim-treesitter'},

  -- Treesitter based text objects
  ['nvim-treesitter/nvim-treesitter-textobjects'] = {after = 'nvim-treesitter'},

  -- Hightligh definition and current scope, smart rename and navigation
  ['nvim-treesitter/nvim-treesitter-refactor'] = {after = 'nvim-treesitter'},

  -- Syntax highlighting
  ['nvim-treesitter/nvim-treesitter'] = {
    run = ':TSUpdate',
    event = {'BufRead', 'BufNewFile'},
    cmd = {
      'TSInstall',
      'TSInstallInfo',
      'TSInstallSync',
      'TSUninstall',
      'TSUpdate',
      'TSUpdateSync',
      'TSDisableAll',
      'TSEnableAll',
    },
    config = function() require('configs.nvim-treesitter').config() end,
  },

  -- Snippet collection
  ['rafamadriz/friendly-snippets'] = {},

  -- Snippet engine
  ['L3MON4D3/LuaSnip'] = {after = 'friendly-snippets', config = function() require('configs.luasnip').config() end},

  -- Completion engine
  ['hrsh7th/nvim-cmp'] = {after = 'LuaSnip', config = function() require('configs.nvim-cmp').config() end},

  -- Snippet completion source
  ['saadparwaiz1/cmp_luasnip'] = {
    after = 'nvim-cmp',
    config = function() require'core.utils'.add_cmp_source('luasnip', 399) end,
  },

  -- Buffer completion source
  ['hrsh7th/cmp-buffer'] = {after = 'nvim-cmp', config = function() require'core.utils'.add_cmp_source 'buffer' end},

  -- Path completion source
  ['hrsh7th/cmp-path'] = {after = 'nvim-cmp', config = function() require'core.utils'.add_cmp_source 'path' end},

  -- LSP completion source
  ['hrsh7th/cmp-nvim-lsp'] = {after = 'nvim-cmp', config = function() require'core.utils'.add_cmp_source 'nvim_lsp' end},

  -- LSP Neovim API completion source
  ['hrsh7th/cmp-nvim-lua'] = {after = 'nvim-cmp', config = function() require'core.utils'.add_cmp_source 'nvim_lua' end},

  -- Repeat plugin maps with "."
  ['tpope/vim-repeat'] = {event = {'BufNewFile', 'BufReadPost'}},

  -- Auto pairs
  ['windwp/nvim-autopairs'] = {event = {'InsertEnter'}, config = function() require('configs.autopairs').config() end},

  -- Markdown
  ['preservim/vim-markdown'] = {ft = {'markdown'}},

  -- Markdown live preview
  ['iamcco/markdown-preview.nvim'] = {
    ft = {'markdown', 'vimwiki'},
    run = 'cd app && yarn install',
    config = function() vim.cmd [[ let g:mkdp_filetypes = ['markdown', 'vimwiki'] ]] end,
  },

  -- Surround textobjects easily
  ['tpope/vim-surround'] = {event = 'BufRead'},

  -- Align texts
  ['junegunn/vim-easy-align'] = {cmd = {'EasyAlign'}},

  -- Move around the whole buffer
  ['ggandor/lightspeed.nvim'] = {event = {'VimEnter'}},

  -- Commenting
  ['numToStr/Comment.nvim'] = {
    module = {'Comment', 'Comment.api'},
    -- event = {'BufRead', 'BufNewFile'},
    keys = {'gc', 'gb', 'g<', 'g>'},
    config = function() require('configs.comment').config() end,
  },

  -- Terminal
  ['akinsho/nvim-toggleterm.lua'] = {
    cmd = 'ToggleTerm',
    module = {'toggleterm', 'toggleterm.terminal'},
    config = function() require('configs.nvim-toggleterm').config() end,
  },

  ['lewis6991/gitsigns.nvim'] = {
    event = {'BufRead', 'BufNewFile'},
    config = function() require('configs.gitsigns').config() end,
  },

  -- Color highlighting
  ['norcalli/nvim-colorizer.lua'] = {
    event = {'BufRead', 'BufNewFile'},
    config = function() require('colorizer').setup() end,
  },

  -- Git
  ['tpope/vim-fugitive'] = {
    cmd = {
      'G',
      'Git',
      'Gdiff',
      'Gclog',
      'Ggrep',
      'Gread',
      'Gwrite',
      'GDelete',
      'GBrowser',
      'Gdiffsplit',
      'Gvdiffsplit',
      'Gfetch',
      'Gfetch',
    },
  },

}

-- Automatically install packer
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
  print 'Installing packer close and reopen Neovim...'
  vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then return end

-- Have packer use a popup window
packer.init {display = {open_fn = function() return require('packer.util').float {border = 'rounded'} end}}

-- Install your plugins here
return packer.startup(
  function(use)
    for key, plugin in pairs(plugins) do
      if type(key) == 'string' and not plugin[1] then plugin[1] = key end
      use(plugin)
    end
    if PACKER_BOOTSTRAP then require('packer').sync() end
  end
)
