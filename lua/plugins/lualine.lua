-- inspired from https://www.reddit.com/r/neovim/comments/1ds30mw/i_replaced_the_mode_names_with_ascii_emoticons/ reddit post
return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "meuter/lualine-so-fancy.nvim",
  },
  enabled = true,
  lazy = false,
  event = { "BufReadPost", "BufNewFile", "VeryLazy" },
  config = function()
    -- use emotes for mode names

    local mode_map = {

      n = "(ᴗ_ ᴗ。)",

      nt = "(ᴗ_ ᴗ。)",

      i = "(•̀ - •́ )",

      R = "( •̯́ ₃ •̯̀)",

      v = "(⊙ _ ⊙ )",

      V = "(⊙ _ ⊙ )",

      no = "Σ(°△°ꪱꪱꪱ)",

      ["\22"] = "(⊙ _ ⊙ )",

      t = "(⌐■_■)",

      ["!"] = "Σ(°△°ꪱꪱꪱ)",

      c = "Σ(°△°ꪱꪱꪱ)",

      s = "SUB",
    }

    local auto_theme_custom = require("lualine.themes.auto")
    auto_theme_custom.normal.c.bg = "none"

    require("lualine").setup({
      options = {
        theme = "poimandres",
      },

      sections = {

        lualine_a = {

          {

            "mode",

            icons_enabled = true,

            separator = {

              left = "",

              right = "",
            },

            fmt = function()
              return mode_map[vim.api.nvim_get_mode().mode] or vim.api.nvim_get_mode().mode
            end,
          },
        },
      },
    })
  end,
}
