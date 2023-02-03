require "amahmod.configs.options"
require "amahmod.configs.lazy"

vim.api.nvim_create_autocmd("User", {
    pattern = "VeryLazy",
    callback = function()
        require "amahmod.configs.autocmds"
        require "amahmod.configs.keymaps"
    end

})
