local M = {}

M.root_patterns = {'.git', '/lua'}

---@param on_attach fun(client, buffer)
function M.on_attach(callback)
    vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
            local buffer = args.buf
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            callback(client, buffer)
        end,
    })
end

return M
