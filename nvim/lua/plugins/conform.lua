return {
	"conform.nvim",
	after = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				c = { "formatter_c" },
				cpp = { "formatter_c" },
				python = { "ruff" },
				nix = { "nixfmt" },
				rust = { "rustfmt", lsp_format = "fallback" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
			-- 自定義formatter
			formatters = {
				formatter_c = {
					command = "clang-format",
					args = {
						"--style={BasedOnStyle: Microsoft, IndentWidth: 4, AlignAfterOpenBracket: DontAlign, ColumnLimit: 0, PointerAlignment: Left}",
					},
					stdin = true,
				},
			},
		})
	end,
}
