return  {
    "aserowy/tmux.nvim",
    lazy = true,
    keys = {
        { "<C-h>", mode = "n" },
        { "<C-j>", mode = "n" },
        { "<C-k>", mode = "n" },
        { "<C-l>", mode = "n" },
    },
    config = function()
        local tmux_nav = require("tmux")

        tmux_nav.setup({
            resize = {
                enable_default_keybindings = false,
            },
        })
        vim.keymap.set('n', "<C-j>", tmux_nav.move_bottom)
        vim.keymap.set('n', "<C-h>", tmux_nav.move_left)
        vim.keymap.set('n', "<C-k>", tmux_nav.move_top)
        vim.keymap.set('n', "<C-l>", tmux_nav.move_right)
    end
}

