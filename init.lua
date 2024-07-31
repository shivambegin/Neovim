vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46_cache/"

require("config.keymaps")
require("config.options")
require("config.lazy")
require("config.autocmd")
require("config.chadmaps")
require("config.neovide")
local integrations = require("nvconfig").base46.integrations
for _, name in ipairs(integrations) do
  dofile(vim.g.base46_cache .. name)
end
--
require("base46").load_all_highlights() -- this compiles + loads hl
