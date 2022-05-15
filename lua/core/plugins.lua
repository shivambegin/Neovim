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
    use {'rcarriga/nvim-notify', config = function() require('configs.notify').config() end}
    -- Neovim UI Enhancer
    use {'MunifTanjim/nui.nvim', module = 'nui'}
    -- Cursorhold fix
    use {
      'antoinemadec/FixCursorHold.nvim',
      event = {'BufRead', 'BufNewFile'},
      config = function() vim.g.cursorhold_updatetime = 100 end,
    }
    -- Indent detection
    use {
      'Darazaki/indent-o-matic',
      event = 'BufRead',
      config = function() require('configs.indent-o-matic').config() end,
    }

    -- Movment
    use 'ggandor/lightspeed.nvim'
    use {'chentoast/marks.nvim', config = function() require('configs.marks').config() end}

    -- theme
    use {
      'norcalli/nvim-colorizer.lua',
      ft = {'css', 'scss', 'sass', 'javascriptreact', 'typescriptreact', 'lua', 'vue', 'svelte'},
      event = {'BufRead', 'BufNewFile'},
      config = function() require('colorizer').setup() end,
    }
    use 'folke/tokyonight.nvim'

    -- File explorer
    use {
      'nvim-neo-tree/neo-tree.nvim',
      module = 'neo-tree',
      cmd = 'Neotree',
      requires = 'MunifTanjim/nui.nvim',
      config = function() require('configs.neo-tree').config() end,
    }

    -- Treesitter
    use {'windwp/nvim-ts-autotag', after = 'nvim-treesitter'}
    use {'JoosepAlviste/nvim-ts-context-commentstring', after = 'nvim-treesitter'}
    use {'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter'}
    use {'nvim-treesitter/nvim-treesitter-refactor', after = 'nvim-treesitter'}
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = function() require('configs.nvim-treesitter').config() end,
    }

    -- Completion
    use {
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
    }
    use {
      'windwp/nvim-autopairs',
      event = {'InsertEnter'},
      config = function() require('configs.autopairs').config() end,
    }

    -- LSP
    use {
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
    }

    -- LSP symbols
    use {
      'simrat39/symbols-outline.nvim',
      cmd = 'SymbolsOutline',
      setup = function() require('configs.symbols-outline').config() end,
    }

    use 'github/copilot.vim'

    -- Fuzyy search
    use {
      'nvim-telescope/telescope.nvim',
      cmd = {'Telescope'},
      config = function() require('configs.telescope').config() end,
    }

    use {
      'nvim-telescope/telescope-project.nvim',
      after = 'telescope.nvim',
      config = function() require('telescope').load_extension 'project' end,
    }

    use {
      'nvim-telescope/telescope-file-browser.nvim',
      after = 'telescope.nvim',
      config = function() require('telescope').load_extension 'file_browser' end,
    }

    use {
      'nvim-telescope/telescope-fzf-native.nvim',
      after = 'telescope.nvim',
      run = 'make',
      config = function() require('telescope').load_extension 'fzf' end,
    }

    use 'windwp/nvim-spectre'

    use {
      'karb94/neoscroll.nvim',
      event = {'BufRead', 'BufNewFile'},
      config = function() require('configs.neoscroll').config() end,
    }
    -- Git
    use {
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
    }
    use {
      'lewis6991/gitsigns.nvim',
      event = {'BufRead', 'BufNewFile'},
      config = function() require('configs.gitsigns').config() end,
    }

    -- Commenting
    use {
      'numToStr/Comment.nvim',
      event = {'BufRead', 'BufNewFile'},
      config = function() require('configs.comment').config() end,
    }

    -- Better buffer closing
    use 'moll/vim-bbye' -- Delete buffer without messing up layout
    -- Bufferline
    use {
      'akinsho/bufferline.nvim',
      after = 'nvim-web-devicons',
      config = function() require('configs.bufferline').config() end,
    }

    -- Editing
    use {'tpope/vim-surround', event = 'BufRead'}
    use {'junegunn/vim-easy-align', cmd = {'EasyAlign'}}

    -- JavaScript
    use {'metakirby5/codi.vim', cmd = {'Codi', 'Codi!', 'Codi!!'}}

    --  Markdown
    use {
      'iamcco/markdown-preview.nvim',
      ft = {'markdown', 'vimwiki'},
      run = 'cd app && yarn install',
      config = function() vim.cmd [[ let g:mkdp_filetypes = ['markdown', 'vimwiki'] ]] end,
    }

    -- Tools
    use {'tpope/vim-repeat'}

    -- Time tracking
    use 'wakatime/vim-wakatime'
    if PACKER_BOOTSTRAP then require('packer').sync() end
  end
)
