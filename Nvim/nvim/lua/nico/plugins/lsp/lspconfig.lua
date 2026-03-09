return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap

		local opts = { noremap = true, silent = true }
		local on_attach = function(client, bufnr)
			vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
			vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)

			opts.buffer = bufnr

			-- set keybinds
			local wk = require("which-key")
			wk.register({
				h = {
					name = "LSP",
					h = { vim.lsp.buf.hover, "Show documentation" },
					r = { vim.lsp.buf.rename, "Rename variable" },
					c = { vim.lsp.buf.code_action, "Code action" },
				},
			}, { prefix = "<leader>" })
		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- Configure html server
		lspconfig["html"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		--Configure openscad server
		lspconfig["openscad_lsp"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- Configure css server
		lspconfig["cssls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- Configure python server
		lspconfig["pyright"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- Configure bash server
		lspconfig["bashls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- Configure csharp server
		lspconfig["csharp_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- Configure ast_grep server
		lspconfig["ast_grep"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- Configure eslint server
		lspconfig["eslint"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- Cofnigure kotlin server
		lspconfig["kotlin_language_server"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- Configure gopls server
		lspconfig["gopls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- Configure clangd server
		lspconfig["clangd"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- Configure rust_analyzer server
		lspconfig["rust_analyzer"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				["rust-analyzer"] = {
					diagnostics = {
						enable = true,
					},
					cargo = {
						allFeatures = true,
					},
				},
			},
		})

		-- Configure arduino_language_server server
		lspconfig["arduino_language_server"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- Configure duster language server
		lspconfig["intelephense"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["zls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure lua server (with special settings)
		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
	end,
}
