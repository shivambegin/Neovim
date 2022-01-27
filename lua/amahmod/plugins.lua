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

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then return end

-- Have packer use a popup window
packer.init {display = {open_fn = function() return require('packer.util').float {border = 'rounded'} end}}

-- Install your plugins here
return packer.startup(
  function(use)
    -- My plugins here
    use 'wbthomason/packer.nvim' -- Have packer manage itself
    use 'nvim-lua/popup.nvim' -- An implementation of the Popup API from vim in Neovim
    use 'nvim-lua/plenary.nvim' -- Useful lua functions used ny lots of plugins
    use 'windwp/nvim-autopairs' -- Autopairs, integrates with both cmp and treesitter
    use 'numToStr/Comment.nvim' -- Easily comment stuff
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
    use 'akinsho/bufferline.nvim'
    use 'moll/vim-bbye'
    use 'nvim-lualine/lualine.nvim'
    use 'lewis6991/impatient.nvim'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'antoinemadec/FixCursorHold.nvim' -- This is needed to fix lsp doc highlight
    use 'windwp/nvim-spectre'
    use 'wakatime/vim-wakatime'
    use 'github/copilot.vim'
    use {'junegunn/vim-easy-align', cmd = {'EasyAlign'}}
    use {'tpope/vim-surround', event = 'BufRead'}
    use 'ggandor/lightspeed.nvim'
    use 'b0o/schemastore.nvim' -- provide json file completion for various file types

    -- Colorscheme
    -- use 'lunarvim/darkplus.nvim'
    use 'norcalli/nvim-colorizer.lua'
    use 'folke/tokyonight.nvim'
    use 'mhartington/oceanic-next'

    -- cmp plugins
    use 'hrsh7th/nvim-cmp' -- The completion plugin
    use 'hrsh7th/cmp-buffer' -- buffer completions
    use 'hrsh7th/cmp-path' -- path completions
    use 'hrsh7th/cmp-cmdline' -- cmdline completions
    use 'saadparwaiz1/cmp_luasnip' -- snippet completions
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'

    -- snippets
    use 'L3MON4D3/LuaSnip' -- snippet engine
    use 'rafamadriz/friendly-snippets' -- a bunch of snippets to use

    -- LSP
    use 'neovim/nvim-lspconfig' -- enable LSP
    use 'williamboman/nvim-lsp-installer' -- simple to use language server installer
    use 'jose-elias-alvarez/null-ls.nvim' -- for formatters and linters
    use {'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu'}
    use {
      'folke/lsp-trouble.nvim',
      config = function() require('trouble').setup() end,
      cmd = {'LspTrouble', 'TroubleToggle'},
    } -- window for showing LSP detected issues in code

    -- Telescope
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-symbols.nvim'
    use 'nvim-telescope/telescope-project.nvim'
    use 'nvim-telescope/telescope-fzy-native.nvim'

    -- TreeSitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'windwp/nvim-ts-autotag'
    use 'JoosepAlviste/nvim-ts-context-commentstring'
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'nvim-treesitter/nvim-treesitter-refactor'

    -- Git
    use 'lewis6991/gitsigns.nvim'
    use {'tpope/vim-fugitive', cmd = {'Git', 'Gdiff', 'Gclog', 'Git mergetool'}}
    use 'ruifm/gitlinker.nvim'

    -- JavaScript {{{
    use {'metakirby5/codi.vim', cmd = {'Codi', 'Codi!', 'Codi!!'}}
    -- }}}
    --
    --  Markdown {{{
    use {
      'iamcco/markdown-preview.nvim',
      ft = {'markdown', 'vimwiki'},
      run = 'cd app && yarn install',
      config = function() vim.cmd [[ let g:mkdp_filetypes = ['markdown', 'vimwiki'] ]] end,
    }

    use {'chentau/marks.nvim'}
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then require('packer').sync() end
  end
)
