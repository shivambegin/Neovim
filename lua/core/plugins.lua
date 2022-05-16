local fn = vim.fn

local plugins = {
  'wbthomason/packer.nvim', -- Have packer manage itself
  'nvim-lua/popup.nvim', -- An implementation of the Popup API from vim in Neovim
  'nvim-lua/plenary.nvim', -- Useful lua functions used ny lots of plugins
  'kyazdani42/nvim-web-devicons',
  {'rcarriga/nvim-notify', config = function() require('configs.notify').config() end},
  -- Neovim UI Enhancer
  {'MunifTanjim/nui.nvim', module = 'nui'},
  -- Cursorhold fix
  {
    'antoinemadec/FixCursorHold.nvim',
    event = {'BufRead', 'BufNewFile'},
    config = function() vim.g.cursorhold_updatetime = 100 end,
  },
  -- Indent detection
  {'Darazaki/indent-o-matic', event = 'BufRead', config = function() require('configs.indent-o-matic').config() end},
  -- Indentation
  {
    'lukas-reineke/indent-blankline.nvim',
    setup = function() require('configs.indent-blankline').setup() end,
    config = function() require('configs.indent-blankline').config() end,
  },

  -- Movment
  'ggandor/lightspeed.nvim',
  {'chentoast/marks.nvim', config = function() require('configs.marks').config() end},

  -- theme
  {
    'norcalli/nvim-colorizer.lua',
    ft = {'css', 'scss', 'sass', 'javascriptreact', 'typescriptreact', 'lua', 'vue', 'svelte'},
    event = {'BufRead', 'BufNewFile'},
    config = function() require('colorizer').setup() end,
  },

  -- 'folke/tokyonight.nvim',
  {'rose-pine/neovim', as = 'rose-pine', tag = 'v1.*', config = function() vim.cmd('colorscheme rose-pine') end},
  -- {'shaunsingh/nord.nvim'},

  -- File explorer
  {
    'nvim-neo-tree/neo-tree.nvim',
    module = 'neo-tree',
    cmd = 'Neotree',
    requires = 'MunifTanjim/nui.nvim',
    config = function() require('configs.neo-tree').config() end,
  },

  -- Treesitter
  {'windwp/nvim-ts-autotag', after = 'nvim-treesitter'},
  {'JoosepAlviste/nvim-ts-context-commentstring', after = 'nvim-treesitter'},
  {'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter'},
  {'nvim-treesitter/nvim-treesitter-refactor', after = 'nvim-treesitter'},
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() require('configs.nvim-treesitter').config() end,
  },

  -- Completion
  {
    'hrsh7th/nvim-cmp',
    config = function() require('configs.nvim-cmp').config() end,
    requires = {
      {'hrsh7th/cmp-cmdline'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-nvim-lsp-signature-help'},
      {'hrsh7th/cmp-nvim-lsp-document-symbol'},
      {'saadparwaiz1/cmp_luasnip'},
      {'L3MON4D3/LuaSnip', config = function() require('configs.luasnip').config() end},
      {'rafamadriz/friendly-snippets'},
      {'hrsh7th/cmp-nvim-lua'},
    },
  },
  {'windwp/nvim-autopairs', event = {'InsertEnter'}, config = function() require('configs.autopairs').config() end},

  -- LSP
  {
    'williamboman/nvim-lsp-installer',
    {
      'neovim/nvim-lspconfig',
      config = function()
        require('configs.lsp.lsp-installer')
        require('configs.lsp').config()
      end,
      requires = {
        'b0o/schemastore.nvim',
        'jose-elias-alvarez/null-ls.nvim',
        {'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu'},
      },
    },
  },

  -- LSP symbols
  {
    'simrat39/symbols-outline.nvim',
    cmd = 'SymbolsOutline',
    setup = function() require('configs.symbols-outline').config() end,
  },

  'github/copilot.vim',

  -- Fuzyy search
  {'nvim-telescope/telescope.nvim', config = function() require('configs.telescope').config() end},

  {
    'nvim-telescope/telescope-project.nvim',
    after = 'telescope.nvim',
    config = function() require('telescope').load_extension 'project' end,
  },

  {
    'nvim-telescope/telescope-file-browser.nvim',
    after = 'telescope.nvim',
    config = function() require('telescope').load_extension 'file_browser' end,
  },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    after = 'telescope.nvim',
    run = 'make',
    config = function() require('telescope').load_extension 'fzf' end,
  },

  'windwp/nvim-spectre',

  {
    'karb94/neoscroll.nvim',
    event = {'BufRead', 'BufNewFile'},
    config = function() require('configs.neoscroll').config() end,
  },
  -- Git
  {
    'tpope/vim-fugitive',
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
  {
    'lewis6991/gitsigns.nvim',
    event = {'BufRead', 'BufNewFile'},
    config = function() require('configs.gitsigns').config() end,
  },

  -- Commenting
  {
    'numToStr/Comment.nvim',
    event = {'BufRead', 'BufNewFile'},
    config = function() require('configs.comment').config() end,
  },

  -- Better buffer closing
  'moll/vim-bbye', -- Delete buffer without messing up layout
  -- Bufferline
  {
    'akinsho/bufferline.nvim',
    after = 'nvim-web-devicons',
    config = function() require('configs.bufferline').config() end,
  },

  -- Editing
  {'tpope/vim-surround', event = 'BufRead'},
  {'junegunn/vim-easy-align', cmd = {'EasyAlign'}},

  -- JavaScript
  {'metakirby5/codi.vim', cmd = {'Codi', 'Codi!', 'Codi!!'}},

  --  Markdown
  {
    'iamcco/markdown-preview.nvim',
    ft = {'markdown', 'vimwiki'},
    run = 'cd app && yarn install',
    config = function() vim.cmd [[ let g:mkdp_filetypes = ['markdown', 'vimwiki'] ]] end,
  },

  -- Tools
  {'tpope/vim-repeat'},

  -- Time tracking
  'wakatime/vim-wakatime',
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
