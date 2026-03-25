return {
	{
		"tokyonight.nvim",
		lazy = false,
		priority = 1000,
		after = function()
			require("tokyonight").setup()
			vim.cmd("colorscheme tokyonight-night")
		end,
	},
	{
		"lualine.nvim",
		event = "DeferredUIEnter",
		after = function()
			require("mini.icons").mock_nvim_web_devicons()
			require("lualine").setup({
				options = {
					theme = "tokyonight",
				},
			})
		end,
	},
	{
		"nvim-tree.lua",
		lazy = false,
		after = function()
			require("mini.icons").mock_nvim_web_devicons()
			require("nvim-tree").setup({
				view = {
					width = 30,
				},
			})
			local api = require("nvim-tree.api")
			vim.keymap.set("n", "<leader>e", api.tree.toggle, { desc = "Toggle nvim-tree" })
		end,
	},
	{
		"fidget.nvim",
		event = "LspAttach",
		after = function()
			require("fidget").setup({
				notification = {
					window = {
						winblend = 100,
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
}
