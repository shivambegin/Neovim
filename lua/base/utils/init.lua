local M = {}

M.root_patterns = { '.git', '/lua' }

M.on_attach = function(callback)
    vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
            local buffer = args.buf
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            callback(client, buffer)
        end,
    })
end

M.toggle_quickfix = function()
    local qf_exists = false
    for _, win in pairs(vim.fn.getwininfo()) do
        if win['quickfix'] == 1 then
            qf_exists = true
        end
    end
    if qf_exists == true then
        vim.cmd 'cclose'
        return
    end
    vim.cmd 'copen'
    -- only open if the list is not empty
    -- if not vim.tbl_isempty(vim.fn.getqflist()) then
    --   vim.cmd "copen"
    -- end
end

--- Check if a plugin is defined in lazy. Useful with lazy loading
--- when a plugin is not necessarily loaded yet.
---@param plugin string The plugin to search for.
---@return boolean available # Whether the plugin is available.
function M.is_available(plugin)
    local lazy_config_avail, lazy_config = pcall(require, 'lazy.core.config')
    return lazy_config_avail and lazy_config.plugins[plugin] ~= nil
end

return M
