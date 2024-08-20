return {
  "nvim-neo-tree/neo-tree.nvim",
  enabled = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  keys = {
    { "<leader>ee", ":Neotree toggle float<CR>", silent = true, desc = "Float File Explorer" },
    { "<leader><tab>", ":Neotree toggle left<CR>", silent = true, desc = "Left File Explorer" },
  },
  cmd = { "Neotree" },
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
        show_hidden_count = true,
        hide_dotfiles = false,
        hide_gitignored = true,
        hide_by_name = {
          ".git",
          ".DS_Store",
          "thumbs.db",
          ".venv",
        },
        never_show = {},
      },
    },
    window = {
      position = "right",
      width = 35,
    },
  },
}
