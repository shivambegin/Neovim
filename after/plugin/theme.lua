--------------------------------------------------------------------------------
-- Generic Colorscheme Tweaks
--------------------------------------------------------------------------------

local Group = require("colorbuddy").Group
local colors = require("colorbuddy").colors

Group.new("CursorLineNr", colors.noir_9, colors.noir_9)
Group.new("VertSplit", nil, nil)
Group.new("StatusLine", nil, nil)
Group.new("StatusLineNC", nil, colors.background)

--------------------------------------------------------------------------------
-- Diagnostic Signs
--------------------------------------------------------------------------------

local signs = {
  DiagnosticSignError = "❱❱",
  DiagnosticSignWarn = "❱❱",
  DiagnosticSignHint = "❱❱",
  DiagnosticSignInfo = "❱❱",
}

for name, sign in pairs(signs) do
  vim.fn.sign_define(name, { texthl = name, text = sign })
end
