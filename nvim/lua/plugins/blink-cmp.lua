return {
	{
		"blink.pairs",
		event = { "InsertEnter", "CmdlineEnter" },
		after = function()
			require("blink.pairs").setup({})
		end,
	},
	{
		"blink.cmp",
		event = { "InsertEnter", "CmdlineEnter" },
		dep_of = { "markview.nvim" },
		after = function()
			vim.opt.spell = true
			vim.opt.spelllang = { "en" }
			require("blink.cmp").setup({
				cmdline = {
					enabled = true,
					keymap = {
						preset = "inherit",
						["<Tab>"] = { "show", "fallback" },
					},
					completion = { menu = { auto_show = true } },
				},
				completion = {
					menu = {
						draw = {
							columns = {
								{ "kind_icon" }, -- 圖示
								{ "label", "label_description", gap = 1 }, -- 插入內容
								{ "source_name" }, --來源 (lsp, buffer, ...)
								{ "kind" }, -- 屬性  (function, property, ...)
							},
							components = {
								kind_icon = {
									text = function(ctx)
										if ctx.source_name ~= "Path" then
											return require("lspkind").symbol_map[ctx.kind] or "" .. ctx.icon_gap
										end

										local is_unknown_type = vim.tbl_contains(
											{ "link", "socket", "fifo", "char", "block", "unknown" },
											ctx.item.data.type
										)
										local mini_icon, _ = require("mini.icons").get(
											is_unknown_type and "os" or ctx.item.data.type,
											is_unknown_type and "" or ctx.label
										)

										return (mini_icon or ctx.kind_icon) .. ctx.icon_gap
									end,

									highlight = function(ctx)
										if ctx.source_name ~= "Path" then
											return ctx.kind_hl
										end

										local is_unknown_type = vim.tbl_contains(
											{ "link", "socket", "fifo", "char", "block", "unknown" },
											ctx.item.data.type
										)
										local mini_icon, mini_hl = require("mini.icons").get(
											is_unknown_type and "os" or ctx.item.data.type,
											is_unknown_type and "" or ctx.label
										)
										return mini_icon ~= nil and mini_hl or ctx.kind_hl
									end,
								},
								label = {
									text = function(ctx)
										return require("colorful-menu").blink_components_text(ctx)
									end,
									highlight = function(ctx)
										return require("colorful-menu").blink_components_highlight(ctx)
									end,
								},
							},
						},
					},
				},
				sources = {
					default = { "spell", "dictionary", "thesaurus", "lsp", "path", "snippets", "buffer" },
					per_filetype = {
						lua = { inherit_defaults = true, "lazydev" },
					},
					providers = {
						spell = {
							name = "Spell",
							module = "blink-cmp-spell",
							opts = {
								-- EXAMPLE: Only enable source in `@spell` captures, and disable it
								-- in `@nospell` captures.
								enable_in_context = function()
									local curpos = vim.api.nvim_win_get_cursor(0)
									local captures = vim.treesitter.get_captures_at_pos(0, curpos[1] - 1, curpos[2] - 1)
									local in_spell_capture = false
									for _, cap in ipairs(captures) do
										if cap.capture == "spell" then
											in_spell_capture = true
										elseif cap.capture == "nospell" then
											return false
										end
									end
									return in_spell_capture
								end,
							},
						},
						thesaurus = {
							name = "blink-cmp-words",
							module = "blink-cmp-words.thesaurus",
							-- All available options
							opts = {
								-- A score offset applied to returned items.
								-- By default the highest score is 0 (item 1 has a score of -1, item 2 of -2 etc..).
								score_offset = 0,

								-- Default pointers define the lexical relations listed under each definition,
								-- see Pointer Symbols below.
								-- Default is as below ("antonyms", "similar to" and "also see").
								definition_pointers = { "!", "&", "^" },

								-- The pointers that are considered similar words when using the thesaurus,
								-- see Pointer Symbols below.
								-- Default is as below ("similar to", "also see" }
								similarity_pointers = { "&", "^" },

								-- The depth of similar words to recurse when collecting synonyms. 1 is similar words,
								-- 2 is similar words of similar words, etc. Increasing this may slow results.
								similarity_depth = 2,
							},
						},

						-- Use the dictionary source
						dictionary = {
							name = "blink-cmp-words",
							module = "blink-cmp-words.dictionary",
							-- All available options
							opts = {
								-- The number of characters required to trigger completion.
								-- Set this higher if completion is slow, 3 is default.
								dictionary_search_threshold = 3,

								-- See above
								score_offset = 0,

								-- See above
								definition_pointers = { "!", "&", "^" },
							},
						},
						lazydev = { name = "LazyDev", module = "lazydev.integrations.blink", fallbacks = { "lsp" } },
					},
				},
			})
		end,
	},
	{
		"lspkind.nvim",
		lazy = true,
		dep_of = "blink.cmp",
		after = function()
			require("lspkind").init()
		end,
	},
	{
		"colorful-menu.nvim",
		lazy = true,
		dep_of = "blink.cmp",
		after = function()
			require("colorful-menu").setup()
		end,
	},
	{
		"friendly-snippets",
		lazy = true,
		dep_of = "blink.cmp",
	},
	{
		"blink-cmp-words",
		lazy = true,
		dep_of = "blink.cmp",
	},
	{
		"blink-cmp-spell",
		lazy = true,
		dep_of = "blink.cmp",
	},
}
