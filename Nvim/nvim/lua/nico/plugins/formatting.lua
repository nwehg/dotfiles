return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
				csharp = { "csharpier" },
				kotlin = { "ktfmt" },
				c = { "clang-format" },
				go = { "crlfmt" },
				php = { "php" },
			},
			formatters = {
				php = {
					command = "PHP_CS_FIXER_IGNORE_ENV=1 php-cs-fixer",
					args = { { "fix" }, "$FILENAME" },
				},
				-- stdin = false,
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			},
		})

		local wk = require("which-key")
		wk.register({
			["<leader>m"] = {
				function()
					conform.format({
						lsp_fallback = true,
						async = false,
						timeout_ms = 500,
					})
				end,
				"Format file",
			},
			mode = "n",
		})
		wk.register({
			["<leader>m"] = {
				function()
					conform.format({
						lsp_fallback = true,
						async = false,
						timeout_ms = 500,
					})
				end,
				"Format selected text",
			},
			mode = "v",
		})
	end,
}
