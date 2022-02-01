local fn = vim.fn

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

    use 'wbthomason/packer.nvim' -- Have packer manage itself
    use 'nvim-lua/popup.nvim' -- An implementation of the Popup API from vim in Neovim
    use 'nvim-lua/plenary.nvim' -- Useful lua functions used ny lots of plugins
    use 'kyazdani42/nvim-web-devicons'

    -- theme
    use {
      'norcalli/nvim-colorizer.lua',
      ft = {'css', 'scss', 'sass', 'javascriptreact', 'typescriptreact', 'lua', 'vue', 'svelte'},
      config = function() require('colorizer').setup() end,
    }
    use 'folke/tokyonight.nvim'

    use {
      'kyazdani42/nvim-tree.lua',
      cmd = {'NvimTreeToggle', 'NvimTreeFindFile'},
      config = 'require(\'plugins.nvim-tree\')',
    }

    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = 'require("plugins.nvim-treesitter")'}
    use 'windwp/nvim-ts-autotag'
    use 'JoosepAlviste/nvim-ts-context-commentstring'
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'nvim-treesitter/nvim-treesitter-refactor'

    -- Completion
    use {
      'hrsh7th/nvim-cmp',
      config = 'require(\'plugins.cmp\')',
      requires = {
        {'hrsh7th/cmp-cmdline'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/cmp-path'},
        {'saadparwaiz1/cmp_luasnip'},
        {'L3MON4D3/LuaSnip', config = 'require(\'plugins.luasnip\')'},
        {'rafamadriz/friendly-snippets'},
        {'hrsh7th/cmp-nvim-lua'},
      },
    }

    -- LSP
    use {
      'neovim/nvim-lspconfig',
      config = 'require(\'plugins.lsp\')',
      requires = {
        'b0o/schemastore.nvim',
        'williamboman/nvim-lsp-installer',
        'jose-elias-alvarez/null-ls.nvim',
        {'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu'},
      },
    }
    use 'github/copilot.vim'

    -- Fuzyy search
    use {
      'nvim-telescope/telescope.nvim',
      cmd = {'Telescope'},
      config = 'require("plugins.telescope")',
      requires = {
        {'nvim-telescope/telescope-file-browser.nvim'},
        {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
        'nvim-telescope/telescope-project.nvim',
      },
    }

    -- Git
    use {'tpope/vim-fugitive', cmd = {'Git', 'Gdiff', 'Gclog', 'Git mergetool', 'Gread', 'Gwrite'}}
    use {'lewis6991/gitsigns.nvim', event = {'BufRead', 'BufNewFile'}, config = 'require(\'plugins.gitsigns\')'}

    if PACKER_BOOTSTRAP then require('packer').sync() end
  end
)
