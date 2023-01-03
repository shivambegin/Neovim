local fn = vim.fn

local plugins = {
    -- ===========================================================================
    -- ============================= Package Manager =============================
    -- ===========================================================================

    ['wbthomason/packer.nvim'] = {},

    -- =========================================================================
    -- =========================== Required Plugins ============================
    -- =========================================================================

    ['nvim-lua/popup.nvim'] = {}, -- An implementation of the Popup API from vim in Neovim
    ['nvim-lua/plenary.nvim'] = {}, -- Useful lua functions used ny lots of plugins

    -- ======================================================================
    -- ================= Theme, Icons, Statusbar, Bufferbar =================
    -- ======================================================================

    -- Icons
    ['kyazdani42/nvim-web-devicons'] = {
        config = function()
            require('nvim-web-devicons').setup()
        end,
    },

    -- Colorscheme
    -- ['EdenEast/nightfox.nvim'] = {},
    -- ['folke/tokyonight.nvim'] = {},
    ['rose-pine/neovim'] = {
        as = 'rose-pine',
    },

    -- Statusline
    ['feline-nvim/feline.nvim'] = {
        event = 'VimEnter',
        after = 'nvim-web-devicons',
        config = function()
            require 'amahmod.configs.feline'
        end,
    },

    -- ===========================================================================
    -- ====================== Treesitter: Better Highlights ======================
    -- ===========================================================================

    -- Syntax highlighting
    ['nvim-treesitter/nvim-treesitter'] = {
        run = ':TSUpdate',
        event = { 'BufRead', 'BufNewFile' },
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
        config = function()
            require('amahmod.configs.nvim-treesitter').config()
        end,
    },

    ['JoosepAlviste/nvim-ts-context-commentstring'] = {
        after = 'nvim-treesitter',
    },
    ['nvim-treesitter/nvim-treesitter-textobjects'] = {
        after = 'nvim-treesitter',
    },
    ['nvim-treesitter/nvim-treesitter-refactor'] = { after = 'nvim-treesitter' },
    ['nvim-treesitter/nvim-treesitter-context'] = {
        after = 'nvim-treesitter',
        config = function()
            require 'amahmod.configs.nvim-treesitter-context'
        end,
    },
    ['windwp/nvim-ts-autotag'] = { after = 'nvim-treesitter' },
    ['andymass/vim-matchup'] = {
        event = 'InsertEnter',
    },

    -- ===========================================================================
    -- =========================== Editor UI Niceties ============================
    -- ===========================================================================

    -- Color highlighting
    ['norcalli/nvim-colorizer.lua'] = {
        event = { 'BufRead', 'BufNewFile' },
        config = function()
            require('colorizer').setup()
        end,
    },

    ['lewis6991/gitsigns.nvim'] = {
        event = { 'BufRead', 'BufNewFile' },
        config = function()
            require('amahmod.configs.gitsigns').config()
        end,
    },

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

    ['karb94/neoscroll.nvim'] = {
        event = 'WinScrolled',
        config = function()
            require('neoscroll').setup { hide_cursor = false }
        end,
    },

    -- ===========================================================================
    -- ======================= Navigation and Fuzzy Search =======================
    -- ===========================================================================

    ['kyazdani42/nvim-tree.lua'] = {
        cmd = 'NvimTreeToggle',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function()
            require('amahmod.configs.nvim-tree').config()
        end,
    },

    ['nvim-telescope/telescope.nvim'] = {
        cmd = 'Telescope',
        module = 'telescope',
        config = function()
            require 'amahmod.configs.telescope'
        end,
        requires = {
            'nvim-telescope/telescope-ui-select.nvim',
        },
    },

    -- Fuzzy finder syntax support
    ['nvim-telescope/telescope-fzf-native.nvim'] = {
        run = 'make',
        cond = vim.fn.executable 'make' == 1,
    },

    -- ===========================================================================
    -- =========================== Editing to the MOON ===========================
    -- ===========================================================================

    ['echasnovski/mini.nvim'] = {
        event = 'BufRead',
        config = function()
            require 'amahmod.configs.mini'
        end,
    },

    ['LiquidFun/vim-comment-banners'] = {
        event = { 'InsertEnter' },
        config = function()
            require 'amahmod.configs.vim-comment-banners'
        end,
    },

    -- Repeat plugin maps with "."
    ['tpope/vim-repeat'] = { event = { 'BufNewFile', 'BufReadPost' } },

    -- Documentation
    ['kkoomen/vim-doge'] = {
        event = { 'InsertEnter' },
        run = ':call doge#install()',
        config = function()
            vim.g.doge_enable_mappings = 0
        end,
    },

    ['ThePrimeagen/harpoon'] = {
        event = { 'BufRead', 'BufNewFile' },
        config = function()
            require('amahmod.configs.harpoon').config()
            require('telescope').load_extension 'harpoon'
        end,
    },

    ['ggandor/leap.nvim'] = {
        event = { 'BufRead', 'BufNewFile' },
        config = function()
            require('leap').add_default_mappings()
        end,
    },

    ['mbbill/undotree'] = {
        command = 'UndotreeToggle',
    },

    ['gpanders/editorconfig.nvim'] = {},

    -- ===========================================================================
    -- ====================== LSP, Completions and Snippets ======================
    -- ===========================================================================

    -- LSP
    ['neovim/nvim-lspconfig'] = {
        event = 'VimEnter',
        requires = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        },
        config = function()
            require 'amahmod.configs.lsp'
        end,
    },

    -- Completion
    ['hrsh7th/nvim-cmp'] = {
        requires = {
            -- snippets
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',
            -- cmp completion sources
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lua',
            'davidsierradz/cmp-conventionalcommits',
            'petertriho/cmp-git',
            'hrsh7th/cmp-cmdline',
        },
        config = function()
            require('amahmod.configs.cmp').config()
        end,
    },

    -- Formattign and Linting
    ['jose-elias-alvarez/null-ls.nvim'] = {
        event = { 'BufRead', 'BufNewFile' },
        config = function()
            require('amahmod.configs.null-ls').config()
        end,
    },

    ['zbirenbaum/copilot.lua'] = {
        event = 'InsertEnter',
        config = function()
            vim.schedule(function()
                require 'amahmod.configs.copilot'
            end)
        end,
    },

    -- =======================================================================
    -- ===================== LANGUAGE SPECIFIC EXTENSION =====================
    -- =======================================================================

    -- Markdown
    ['preservim/vim-markdown'] = { ft = { 'markdown' } },

    -- Markdown live preview
    ['iamcco/markdown-preview.nvim'] = {
        ft = { 'markdown', 'vimwiki' },
        run = 'cd app && yarn install',
        config = function()
            vim.cmd [[ let g:mkdp_filetypes = ['markdown', 'vimwiki'] ]]
        end,
    },

    -- Rust
    ['simrat39/rust-tools.nvim'] = {
        ft = { 'rust' },
        module = 'rust-tools',
    },

    -- =========================================================================
    -- ================================= MISC ==================================
    -- =========================================================================

    -- Time tracking
    ['wakatime/vim-wakatime'] = { event = 'VimEnter' },
}

-- Automatically install packer
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    print 'Installing packer.nvim...'
    PACKER_BOOTSTRAP = fn.system {
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path,
    }
    print 'Installing packer close and reopen Neovim...'
    vim.cmd [[packadd! packer.nvim]]
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require('packer.util').float { border = 'rounded' }
        end,
    },
}

-- Install your plugins here
return packer.startup(function(use)
    for key, plugin in pairs(plugins) do
        if type(key) == 'string' and not plugin[1] then
            plugin[1] = key
        end
        use(plugin)
    end
    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end
end)
