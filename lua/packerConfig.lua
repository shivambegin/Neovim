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

    -- theme
    use { "norcalli/nvim-colorizer.lua",
      ft = {
        "css",
        "scss",
        "sass",
        "javascriptreact",
        "typescriptreact",
        "lua",
        'vue',
        'svelte'
      },
      config = function()
        require("colorizer").setup()
      end,
    } 
    use  'folke/tokyonight.nvim' 

    if PACKER_BOOTSTRAP then require('packer').sync() end
  end
)
