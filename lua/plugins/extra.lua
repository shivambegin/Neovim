--TODO  find out use case for some of this plugins
return {
  { "utilyre/sentiment.nvim", event = "BufReadpre", config = true }, --* Bracket highlighter *--
  { "rachartier/tiny-inline-diagnostic.nvim", event = "VeryLazy", config = true }, --* really good looking diagnostics
  { "ethanholz/nvim-lastplace", lazy = false, config = true }, --* Remember cursor position
  { --* Write with administartives privileges in neovim *--
    "lambdalisue/suda.vim",
    cmd = "SudaWrite",
    init = function()
      vim.cmd([[let g:suda#nopass = 1]])
    end,
  },

  {
    "dstein64/vim-startuptime",
    cmd = { "StartupTime" },
  },
  {
    "fowlie/open-github-repo",
    enabled = false,
  },

  -- useful when there are embedded languages in certain types of files (e.g. Vue or React)
  { "joosepalviste/nvim-ts-context-commentstring", lazy = true },

  -- Heuristically set buffer options
  {
    "tpope/vim-sleuth",
  },

  {
    "christoomey/vim-tmux-navigator",
    enabled = false,
  },

  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },

  { "b0o/schemastore.nvim", lazy = true },

  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    config = function()
      require("project_nvim").setup({
        -- Manual mode doesn't automatically change your root directory, so you have
        -- the option to manually do so using `:ProjectRoot` command.
        manual_mode = false,

        -- Methods of detecting the root directory. **"lsp"** uses the native neovim
        -- lsp, while **"pattern"** uses vim-rooter like glob pattern matching. Here
        -- order matters: if one is not detected, the other is used as fallback. You
        -- can also delete or rearangne the detection methods.
        detection_methods = { "pattern", "lsp" },

        -- All the patterns used to detect root dir, when **"pattern"** is in
        -- detection_methods
        patterns = { ".git", ".vscode", ".svn", "Makefile", "package.json" },

        -- Table of lsp clients to ignore by name
        -- eg: { "efm", ... }
        ignore_lsp = {},

        -- Don't calculate root dir on specific directories
        -- Ex: { "~/.cargo/*", ... }
        exclude_dirs = {},

        -- Show hidden files in telescope
        show_hidden = false,

        -- When set to false, you will get a message when project.nvim changes your
        -- directory.
        silent_chdir = true,

        -- What scope to change the directory, valid options are
        -- * global (default)
        -- * tab
        -- * win
        scope_chdir = "global",

        -- Path where project.nvim will store the project history for use in
        -- telescope
        datapath = vim.fn.stdpath("data"),
      })
    end,
  },

  {
    "moll/vim-bbye",
    cmd = { "Bdelete", "Bwipeout" },
  },

  {
    "MaximilianLloyd/tw-values.nvim",
    enabled = false, --not using tailwind
    keys = {
      { "<leader>Tw", "<cmd>TWValues<cr>", desc = "Show tailwind CSS values" },
    },
    opts = {
      border = "rounded", -- Valid window border style,
      show_unknown_classes = true, -- Shows the unknown classes popup
      focus_preview = true, -- Sets the preview as the current window
      copy_register = "", -- The register to copy values to,
      keymaps = {
        copy = "<C-y>", -- Normal mode keymap to copy the CSS values between {}
      },
    },
  },
  {
    "calops/hmts.nvim",
    enabled = false, --not using nix
    version = "*",
  },
}
