return {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = (vim.fn.has('nvim-0.11.3') == 1)
        and { root_markers1 or {}, root_markers2 or {}, { '.git' } }
        or vim.list_extend(vim.list_extend(root_markers1 or {}, root_markers2 or {}), { '.git' }),
    ---@type lspconfig.settings.lua_ls
    settings = {
        Lua = {
            codeLens = { enable = true },
            hint = { enable = true, semicolon = 'Disable' },
            telemetry = { enable = false },
            workspace = { checkThirdParty = false },
            diagnostics = {
                globals = { 'vim' },
            },
        },
    },
}
