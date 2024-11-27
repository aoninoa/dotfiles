return {
    "stevearc/oil.nvim",
    lazy = true,
    keys = {
        { "-", mode = "n" }
    },
    config = function()
        local oil = require("oil")
        vim.keymap.set("n", "-", oil.open_float)
        oil.setup({})
    end
}
