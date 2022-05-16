local fn = vim.fn

local plugins = {
  -- Plugin manager
  ['wbthomason/packer.nvim'] = {},

  -- Optimiser
  ['lewis6991/impatient.nvim'] = {},

  -- An implementation of the Popup API from vim in Neovim
  ['nvim-lua/popup.nvim'] = {},

  -- Useful lua functions used ny lots of plugins
  ['nvim-lua/plenary.nvim'] = {},

  -- -- Colorscheme
  -- -- 'folke/tokyonight.nvim',
  ['rose-pine/neovim'] = {as = 'rose-pine', tag = 'v1.*', config = function() vim.cmd('colorscheme rose-pine') end},
  -- -- {'shaunsingh/nord.nvim'},

  -- Indent detection
  ['Darazaki/indent-o-matic'] = {
    event = 'BufReadPost',
    config = function() require('configs.indent-o-matic').config() end,
  },

  -- Neovim UI Enhancer
  ['MunifTanjim/nui.nvim'] = {module = 'nui'},

  -- Notification Enhancer
  ['rcarriga/nvim-notify'] = {event = 'VimEnter', config = function() require('configs.notify').config() end},

  -- Cursorhold fix
  ['antoinemadec/FixCursorHold.nvim'] = {
    event = {'BufRead', 'BufNewFile'},
    config = function() vim.g.cursorhold_updatetime = 100 end,
  },

  -- Smarter Splits
  ['mrjones2014/smart-splits.nvim'] = {
    module = 'smart-splits',
    config = function() require('configs.smart-splits').config() end,
  },

  -- Icons
  ['kyazdani42/nvim-web-devicons'] = {
    event = 'VimEnter',
    config = function() require('configs.nvim-web-devicons').config() end,
  },

  -- Better buffer closing
  ['famiu/bufdelete.nvim'] = {cmd = {'Bdelete', 'Bwipeout'}},

  -- Bufferline
  ['akinsho/bufferline.nvim'] = {
    after = 'nvim-web-devicons',
    config = function() require('configs.bufferline').config() end,
  },

  -- File explorer
  ['nvim-neo-tree/neo-tree.nvim'] = {
    module = 'neo-tree',
    cmd = 'Neotree',
    requires = {'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim'},
    config = function() require('configs.neo-tree').config() end,
  },

  -- Simple statusline component that shows what scope you are working inside
  ['SmiteshP/nvim-gps'] = {after = 'nvim-treesitter'},

  -- Statusline
  ['feline-nvim/feline.nvim'] = {
    after = {'nvim-web-devicons', 'nvim-gps'},
    config = function() require('configs.feline').config() end,
  },

  -- Auto close tag
  ['windwp/nvim-ts-autotag'] = {after = 'nvim-treesitter'},

  -- Conetxt based commenting
  ['JoosepAlviste/nvim-ts-context-commentstring'] = {after = 'nvim-treesitter'},

  ['nvim-treesitter/nvim-treesitter-textobjects'] = {after = 'nvim-treesitter'},
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
  ['rafamadriz/friendly-snippets'] = {event = 'InsertEnter'},

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

  -- LSP signature completion source
  ['hrsh7th/cmp-nvim-lsp-signature-help'] = {
    after = 'nvim-cmp',
    config = function() require'core.utils'.add_cmp_source 'nvim_lsp_signature_help' end,
  },

  -- LSP Neovim API completion source
  ['hrsh7th/cmp-nvim-lua'] = {after = 'nvim-cmp', config = function() require'core.utils'.add_cmp_source 'nvim_lua' end},

  -- Built-in LSP
  ['neovim/nvim-lspconfig'] = {event = 'VimEnter'},

  -- LSP installer
  ['williamboman/nvim-lsp-installer'] = {
    after = 'nvim-lspconfig',
    config = function()
      require('configs.lsp.lsp-installer')
      require('configs.lsp').config()
    end,
    requires = {'b0o/schemastore.nvim'},
  },

  -- Formattign and Linting
  ['jose-elias-alvarez/null-ls.nvim'] = {
    event = {'BufRead', 'BufNewFile'},
    config = function() require('configs.null-ls').config() end,
  },

  -- Fuzyy finder
  ['nvim-telescope/telescope.nvim'] = {
    module = 'telescope',
    cmd = 'Telescope',
    config = function() require('configs.telescope').config() end,
  },

  ['nvim-telescope/telescope-project.nvim'] = {
    after = 'telescope.nvim',
    config = function() require('telescope').load_extension 'project' end,
  },

  ['nvim-telescope/telescope-file-browser.nvim'] = {
    after = 'telescope.nvim',
    config = function() require('telescope').load_extension 'file_browser' end,
  },

  -- Fuzzy finder syntax support
  [('nvim-telescope/telescope-%s-native.nvim'):format(vim.fn.has 'win32' == 1 and 'fzy' or 'fzf')] = {
    after = 'telescope.nvim',
    run = 'make',
    config = function() require('telescope').load_extension(vim.fn.has 'win32' == 1 and 'fzy_native' or 'fzf') end,
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

  ['lewis6991/gitsigns.nvim'] = {
    event = {'BufRead', 'BufNewFile'},
    config = function() require('configs.gitsigns').config() end,
  },

  -- Color highlighting
  ['norcalli/nvim-colorizer.lua'] = {
    event = {'BufRead', 'BufNewFile'},
    config = function() require('colorizer').setup() end,
  },

  -- Auto pairs
  ['windwp/nvim-autopairs'] = {event = {'InsertEnter'}, config = function() require('configs.autopairs').config() end},

  -- Terminal
  ['akinsho/nvim-toggleterm.lua'] = {
    cmd = 'ToggleTerm',
    module = {'toggleterm', 'toggleterm.terminal'},
    config = function() require('configs.nvim-toggleterm').config() end,
  },

  -- Commenting
  ['numToStr/Comment.nvim'] = {
    module = {'Comment', 'Comment.api'},
    -- event = {'BufRead', 'BufNewFile'},
    keys = {'gc', 'gb', 'g<', 'g>'},
    config = function() require('configs.comment').config() end,
  },

  -- Indentation
  ['lukas-reineke/indent-blankline.nvim'] = {
    event = 'BufRead',
    setup = function() require('configs.indent-blankline').setup() end,
    config = function() require('configs.indent-blankline').config() end,
  },

  -- Smooth scrolling
  ['karb94/neoscroll.nvim'] = {
    event = {'BufRead', 'BufNewFile'},
    config = function() require('configs.neoscroll').config() end,
  },

  ----------------------------------------------------

  -- Move around the whole buffer
  ['ggandor/lightspeed.nvim'] = {event = {'VimEnter'}},

  -- Marks management
  ['chentoast/marks.nvim'] = {event = {'VimEnter'}, config = function() require('configs.marks').config() end},

  -- LSP code action menu
  ['weilbith/nvim-code-action-menu'] = {cmd = 'CodeActionMenu'},

  -- LSP symbols outline
  ['simrat39/symbols-outline.nvim'] = {
    cmd = 'SymbolsOutline',
    setup = function() require('configs.symbols-outline').config() end,
  },

  -- AI based auto completion
  ['github/copilot.vim'] = {},

  -- Find and replace enhancer
  ['windwp/nvim-spectre'] = {event = {'VimEnter'}},

  -- Surround textobjects easily
  ['tpope/vim-surround'] = {event = 'BufRead'},

  -- Align texts
  ['junegunn/vim-easy-align'] = {cmd = {'EasyAlign'}},

  -- JavaScript interactive scratchpad
  ['metakirby5/codi.vim'] = {cmd = {'Codi', 'Codi!', 'Codi!!'}},

  -- Markdown live preview
  ['iamcco/markdown-preview.nvim'] = {
    ft = {'markdown', 'vimwiki'},
    run = 'cd app && yarn install',
    config = function() vim.cmd [[ let g:mkdp_filetypes = ['markdown', 'vimwiki'] ]] end,
  },

  -- Repeat plugin maps with "."
  ['tpope/vim-repeat'] = {event = {'BufNewFile', 'BufReadPost'}},

  -- Time tracking
  ['wakatime/vim-wakatime'] = {},
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
