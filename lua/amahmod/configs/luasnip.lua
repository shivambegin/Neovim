local M = {}

function M.config()
    local loader_avail, loader = pcall(require, 'luasnip/loaders/from_vscode')
    if loader_avail then
        loader.lazy_load()
    end
end

return M
