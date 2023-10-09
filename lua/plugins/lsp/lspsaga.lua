-- return  {
--     "nvimdev/lspsaga.nvim",
--     lazy = true,
--     event = { "LspAttach" },
--     dependencies = {
--       "neovim/nvim-lspconfig",
--       "nvim-treesitter/nvim-treesitter",
--     },
--     opts = {
--       ui = {
--         title = false,
--       },
--       outline = {
--         keys = {
--           expand_or_jump = "<cr>",
--         },
--       },
--       finder = {
--         keys = {
--           vsplit = "v",
--           split = "s",
--           quit = { "q", "<esc>" },
--           edit = { "<cr>" },
--           close_in_preview = "q",
--         },
--       },
--       definition = {
--         edit = "<cr>",
--         vsplit = "<C-v>",
--         split = "<C-s>",
--         tabe = "<C-t>",
--       },
--       lightbulb = {
--         enable = false,
--         enable_in_insert = false,
--       },
--       -- breadcrumbs
--       -- https://github.com/glepnir/lspsaga.nvim#lspsaga-symbols-in-winbar
--       symbol_in_winbar = {
--         enable = false,
--       },
--       beacon = {
--         enable = false,
--       },
--       implement = {
--         enable = false,
--       },
--       -- diagnostic = {
--       --   extend_relatedInformation = true,
--       -- },
--     },
--   }
return{
  "glepnir/lspsaga.nvim",
  config = function()
    require("lspsaga").setup {
      lightbulb = {
        enable = true,
        sign = true,
        sign_priority = 20,
        virtual_text = false,
      },
      ui = {
        -- currently only round theme
        theme = "round",
        -- border type can be single,double,rounded,solid,shadow.
        border = "solid",
        winblend = 0,
        expand = "",
        collapse = "",
        preview = " ",
        code_action = "",
        diagnostic = "🐞",
        incoming = " ",
        outgoing = " ",
        -- colors = require("catppuccin.groups.integrations.lsp_saga").custom_colors(),
        -- kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
      },
      rename_action_quit = "<C-c>",
      symbol_in_winbar = {
        enable = true,
        separator = " > ",
        show_file = true,
        folder_level = 1,
        color_mode = true,
      },
      server_filetype_map = {},
    }
  end,
}
