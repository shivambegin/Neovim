local fn = vim.fn

local plugins = {
  -- Plugin manager
  ['wbthomason/packer.nvim'] = {},


  -- An implementation of the Popup API from vim in Neovim
  ['nvim-lua/popup.nvim'] = {},

  -- Useful lua functions used ny lots of plugins
  ['nvim-lua/plenary.nvim'] = { module = 'plenary' },

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
