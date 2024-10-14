return {
  "LudoPinelli/comment-box.nvim",
  config = function()
    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }

    -- Titles
    keymap({ "n", "v" }, "<Leader>cb", "<Cmd>CBccbox<CR>", opts)
    -- Named parts
    keymap({ "n", "v" }, "<Leader>ct", "<Cmd>CBllline<CR>", opts)
    -- Simple line
    keymap("n", "<Leader>cl", "<Cmd>CBline<CR>", opts)
    -- keymap("i", "<M-l>", "<Cmd>CBline<CR>", opts) -- To use in Insert Mode
    -- Marked comments
    keymap({ "n", "v" }, "<Leader>cm", "<Cmd>CBllbox14<CR>", opts)
    -- Removing a box is simple enough with the command (CBd), but if you
    -- use it a lot:
    -- keymap({ "n", "v" }, "<Leader>cd", "<Cmd>CBd<CR>", opts)
  end,
}
