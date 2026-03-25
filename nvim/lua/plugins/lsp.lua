return {
	{
		"fidget.nvim",
		event = "LspAttach",
		after = function()
			require("fidget").setup({
				notification = {
					window = {
						winblend = 1,
					},
				},
			})
		end,
	},
	{
		"tiny-inline-diagnostic.nvim",
		event = "LspAttach",
		after = function()
			vim.diagnostic.config({ virtual_text = false })
			require("tiny-inline-diagnostic").setup({
				preset = "ghost",
				options = {
					enable_on_insert = true,
					multilines = {
						enabled = true,
					},
				},
			})
		end,
	},
	{
		"lazydev.nvim",
		ft = "lua",
		dep_of = { "blink.cmp" },
	},
}
