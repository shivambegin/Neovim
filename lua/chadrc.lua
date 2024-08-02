---@diagnostic disable: inject-field, undefined-doc-name
---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "chadracula-evondev",
  transparency = false,
  statusline = {
    theme = "minimal", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "block",
    order = { "mode", "file", "git", "%=", "lsp", "%=", "diagnostics", "cwd" },
    modules = {},
  },
  -- lazyload it when there are 1+ buffers
  tabufline = {
    enabled = true,
    lazyload = true,
    order = { "treeOffset", "buffers", "tabs" },
    modules = nil,
  },
  cmp = {
    icons = true,
    lspkind_text = true,
    style = "atom_colored", -- default/flat_light/flat_dark/atom/atom_colored
  },
  telescope = { style = "borderless" }, -- borderless / bordered
  nvdash = {
    load_on_startup = true,

    header = {
      [[  ███       ███  ]],
      [[  ████      ████ ]],
      [[  ████     █████ ]],
      [[ █ ████    █████ ]],
      [[ ██ ████   █████ ]],
      [[ ███ ████  █████ ]],
      [[ ████ ████ ████ ]],
      [[ █████  ████████ ]],
      [[ █████   ███████ ]],
      [[ █████    ██████ ]],
      [[ █████     █████ ]],
      [[ ████      ████ ]],
      [[  ███       ███  ]],
      [[                    ]],
      [[  N  E  O  V  I  M  ]],
    },

    buttons = {},
  },
  term = {
    winopts = { number = false, relativenumber = false },
    sizes = { sp = 0.5, vsp = 0.5, ["bo sp"] = 0.5, ["bo vsp"] = 0.5 },
    float = {
      relative = "editor",
      row = 0.5,
      col = 0.5,
      width = 0.5,
      height = 0.5,
      border = "single",
    },
  },
  lsp = { signature = true },
}

return M
