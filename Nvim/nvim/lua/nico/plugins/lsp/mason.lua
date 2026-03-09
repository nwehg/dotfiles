return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"ast_grep",
				"html",
				"cssls",
				"lua_ls",
				"pyright",
				"openscad_lsp",
				"bashls",
				"csharp_ls",
				"eslint",
				"kotlin_language_server",
				"gopls",
				"clangd",
				"rust_analyzer",
				"intelephense",
				"zls",
			},
			automatic_installation = true,
		})
	end,
}
