local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("amahmod.lsp.lsp-installer")
require("amahmod.lsp.handlers").setup()
