require 'core.options'
require 'core.plugins'
require 'core.autocommands'
require 'core.mappings'
require 'core.colorscheme'

local status_ok, ui = pcall(require, 'core.ui')
if status_ok then ui.init() end
