-- A snazzy bufferline for Neovim
return {
  "akinsho/bufferline.nvim",
  enabled = false,
  dependencies = {
    { "echasnovski/mini.bufremove", version = "*" },
    "nvim-tree/nvim-web-devicons",
  },
  event = "VeryLazy",
  keys = {
    {
      "<leader>bc",
      function()
        require("mini.bufremove").delete(0, false)
      end,
      desc = "Close current buffer",
    },
    {
      "<leader>bc",
      function()
        require("mini.bufremove").delete(0, true)
      end,
      desc = "Close current buffer (force)",
    },
    { "<leader>bD", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Close non-pinned buffers" },
    { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Close other buffers" },
    { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Close buffers to the right" },
    { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Close buffers to the left" },
    { "<Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
    { "<S-Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
  },
  opts = {
    options = {
      close_command = function(n)
        require("mini.bufremove").delete(n, false)
      end,
      right_mouse_command = function(n)
        require("mini.bufremove").delete(n, false)
      end,
      diagnostics = "nvim_lsp",
      separator_style = "thin",
      always_show_bufferline = false,
      offsets = {
        {
          filetype = "NvimTree",
          text = "",
          highlight = "Directory",
          text_align = "left",
          separator = false,
        },
      },
    },
  },
}
