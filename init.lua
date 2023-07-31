-- Compile lua to bytecode if the nvim version supports it.
if vim.loader and vim.fn.has 'nvim-0.9.1' == 1 then
    vim.loader.enable()
end

require 'base.options'
require 'base.autocmds'
require 'base.mappings'
require 'base.lazy'
