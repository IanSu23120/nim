return {
    "mini.icons",
    lazy = true,
    dep_of = { "blink.cmp", "fzf-lua", "lualine.nvim", "nvim-tree.lua" },
    on_require = {"mini.icons"},
    after = function ()
      require("mini.icons").setup()
    end,
}
