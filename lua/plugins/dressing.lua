return {
  "stevearc/dressing.nvim",
  event = "VeryLazy",
  config = function()
    local status_ok, dressing = pcall(require, "dressing")
    if not status_ok then
      return
    end

    dressing.setup({
      win_options = {
        winblend = 10,
        winhighlight = "Normal:DressingInputNormalFloat,NormalFloat:DressingInputNormalFloat,FloatBorder:DressingInputFloatBorder",
      },
      input = {
        enabled = true,
        default_prompt = "Input:",
        prompt_align = "left",
        insert_only = true,
        start_in_insert = true,
        border = "rounded",
        relative = "cursor",
        prefer_width = 40,
        width = nil,
        max_width = { 140, 0.9 },
        min_width = { 20, 0.2 },
        get_config = nil,
      },
      select = {
        enabled = true,
        backend = { "telescope", "fzf_lua", "fzf", "nui", "builtin" },
        trim_prompt = true,
      },
    })
  end,
}
