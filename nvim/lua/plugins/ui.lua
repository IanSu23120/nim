return {
	{
		"tokyonight.nvim",
		lazy = false,
		priority = 1000,
		after = function()
			require("tokyonight").setup()
			vim.cmd("colorscheme tokyonight-storm")
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
			vim.api.nvim_create_autocmd("BufEnter", {
				group = vim.api.nvim_create_augroup("NvimTreeClose", { clear = true }),
				pattern = "NvimTree_*",
				callback = function()
					local layout = vim.api.nvim_call_function("winlayout", {})
					if
						layout[1] == "leaf"
						and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree"
						and layout[3] == nil
					then
						vim.cmd("confirm quit")
					end
				end,
			})
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
