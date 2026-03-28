return {
	"fzf-lua",
	cmd = "FzfLua",
	keys = {
		{
			"<leader>ff",
			function()
				require("fzf-lua").files()
			end,
			desc = "[F]ind [f]ile",
		},
		{
			"<leader>fo",
			function()
				require("fzf-lua").oldfiles()
			end,
			desc = "[F]ind [o]ldfiles",
		},
		{
			"<leader>//",
			function()
				require("fzf-lua").live_grep()
			end,
			desc = "live grep current project",
		},
		{
			"<leader>/w",
			function()
				require("fzf-lua").grep_cword()
			end,
			desc = "live grep current [w]ord",
		},
		{
			"<leader>/W",
			function()
				require("fzf-lua").grep_cWORD()
			end,
			desc = "live grep current [W]ord",
		},
		-- LSP
		{
			"<leader>gr",
			function()
				require("fzf-lua").lsp_references()
			end,
			desc = "[G]o [R]eferences",
		},
		{
			"<leader>gd",
			function()
				require("fzf-lua").lsp_definitions()
			end,
			desc = "[G]o [d]efinitions",
		},
		{
			"<leader>gD",
			function()
				require("fzf-lua").lsp_declarations()
			end,
			desc = "[G]o [D]eclarations",
		},
		{
			"<leader>gt",
			function()
				require("fzf-lua").lsp_typedefs()
			end,
			desc = "[G]o [t]ype definitions",
		},
		{
			"<leader>gi",
			function()
				require("fzf-lua").lsp_implementations()
			end,
			desc = "[G]o [i]mplementations",
		},
		{
			"<leader>gs",
			function()
				require("fzf-lua").lsp_document_symbols()
			end,
			desc = "[G]o live document [s]ymbols",
		},
		{
			"<leader>gS",
			function()
				require("fzf-lua").lsp_live_workspace_symbols()
			end,
			desc = "[G]o live workspace [S]ymbols",
		},
		{
			"<leader>gc",
			function()
				require("fzf-lua").lsp_incoming_calls()
			end,
			desc = "[G]o incoming [c]alls", -- who calls me
		},
		{
			"<leader>gC",
			function()
				require("fzf-lua").lsp_outgoing_calls()
			end,
			desc = "[G]o outgoing [C]alls", -- I call who
		},
	},
}
