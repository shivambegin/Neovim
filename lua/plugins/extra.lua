--TODO  find out use case for some of this plugins
return {
  -- vim-matchup aternative
  { "ethanholz/nvim-lastplace", lazy = false, config = true }, --* Remember cursor position
  { --* Write with administartives privileges in neovim *--
    "lambdalisue/suda.vim",
    cmd = { "SudaRead", "SudaWrite" },
    init = function()
      vim.cmd([[let g:suda#nopass = 1]])
    end,
  },

  {
    "dstein64/vim-startuptime",
    enabled = false,
    cmd = { "StartupTime" },
  },

  -- useful when there are embedded languages in certain types of files (e.g. Vue or React)
  { "joosepalviste/nvim-ts-context-commentstring", lazy = true },

  -- Heuristically set buffer options
  {
    "tpope/vim-sleuth",
    lazy = true,
    event = { "BufNewFile", "BufReadPost", "BufFilePost" },
  },

  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },

  { "b0o/schemastore.nvim", lazy = true, enabled = false }, -- TODO: proper config required to use it
  {
    "moll/vim-bbye",
    cmd = { "Bdelete", "Bwipeout" },
  },
}
