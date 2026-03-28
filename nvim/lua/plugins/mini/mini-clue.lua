return {
	"mini.clue",
	lazy = false,
	after = function()
		require("mini.clue").setup({
			triggers = {
				{ mode = { "n", "x" }, keys = "<leader>" },
			},
			window = {
				delay = 100,
			},
		})
	end,
}
