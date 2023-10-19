return  {
    "luukvbaal/statuscol.nvim",
    config = function()
      local builtin = require("statuscol.builtin")
      require("statuscol").setup({
        ft_ignore = { "neo-tree" },
        segments = {
          { sign = { name = { "Diagnostic" } } },
          { sign = { name = { "Dap.*" } } },
          { text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
          { sign = { name = { "GitSigns.*" } } },
        },
      })
    end,
  }
