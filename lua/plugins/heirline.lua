return {
  "rebelot/heirline.nvim",
  enabled = true,
  dependencies = { "zeioth/heirline-components.nvim" },
  event = { "BufReadPost", "BufAdd", "BufNewFile" },
  opts = function()
    local lib = require("heirline-components.all")
    return {
      tabline = { -- UI upper bar
        lib.component.tabline_conditional_padding(),
        lib.component.tabline_buffers(),
        lib.component.fill({ hl = { bg = "tabline_bg" } }),
        lib.component.tabline_tabpages(),
      },
      statusline = { -- UI statusbar
        hl = { fg = "fg", bg = "bg" },
        lib.component.mode(),
        lib.component.git_branch(),
        lib.component.file_info(),
        lib.component.git_diff(),
        lib.component.diagnostics(),
        lib.component.fill(),
        lib.component.cmd_info(),
        lib.component.fill(),
        lib.component.lsp(),
        lib.component.virtual_env(),
        lib.component.nav(),
        lib.component.mode({ surround = { separator = "right" } }),
      },
    }
  end,
  config = function(_, opts)
    local heirline = require("heirline")
    local heirline_components = require("heirline-components.all")

    -- Setup
    heirline_components.init.subscribe_to_events()
    heirline.load_colors(heirline_components.hl.get_colors())
    heirline.setup(opts)
  end,
}
