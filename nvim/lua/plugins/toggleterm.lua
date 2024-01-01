return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup({
            size = 10,
            open_mapping = [[<c-\>]],
            start_in_insert = true,
            persist_mode = true,
            terminal_mappings = true,
        })
        vim.keymap.set('t', '<C-[>', [[<C-\><C-n>]], {})
    end
}
