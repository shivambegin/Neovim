return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    require("mini.surround").setup({})
    require("mini.pairs").setup({})
    require("mini.move").setup({})
    require("mini.bracketed").setup({

      file = { suffix = "" },
      window = { suffix = "" },
      quickfix = { suffix = "" },
      yank = { suffix = "" },
      treesitter = { suffix = "n" },
    })
    -- require("mini.align").setup({})
    -- local statusline = require("mini.statusline")
    -- -- set use_icons to true if you have a Nerd Font
    -- statusline.setup({ use_icons = vim.g.have_nerd_font })
    --
    -- -- You can configure sections in the statusline by overriding their
    -- -- default behavior. For example, here we set the section for
    -- -- cursor location to LINE:COLUMN
    -- ---@diagnostic disable-next-line: duplicate-set-field
    -- statusline.section_location = function()
    --   return "%2l:%-2v"
    -- end
  end,
}
