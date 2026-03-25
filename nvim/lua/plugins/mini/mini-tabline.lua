return {
    "mini.tabline",
    event = "DeferredUIEnter",
    after = function()
        require("mini.tabline").setup()
    end,
}
