return {
  "b0o/incline.nvim",
  event = { "BufReadPost", "BufAdd", "BufNewFile" },
  config = function()
    require("incline").setup({
      highlight = {
        groups = {
          InclineNormal = { guibg = "#303270", guifg = "#a9b1d6" },
          InclineNormalNC = { guibg = "none", guifg = "#a9b1d6" },
        },
      },
      window = { margin = { vertical = 0, horizontal = 1 } },
      hide = { cursorline = true },
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        if vim.bo[props.buf].modified then
          filename = "[*]" .. filename
        end

        local icon, color = require("nvim-web-devicons").get_icon_color(filename)

        return { { icon, guifg = color }, { " " }, { filename } }
      end,
    })
  end,
}
