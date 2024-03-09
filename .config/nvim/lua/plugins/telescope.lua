return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        lazy = true,
        config = function()
            local opts = { silent = true, noremap = true }
            local builtin = require("telescope.builtin")
            vim.keymap.set('n', '<leader>ff', builtin.find_files, opts)
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, opts)
            vim.keymap.set("n", "<leader>fb", builtin.buffers, opts)
            vim.keymap.set("n", "<leader>fn", builtin.help_tags, opts)
        end
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        lazy = true,
        keys = {
            {"<leader>ff", mode = "n"},
            {"<leader>fg", mode = "n"},
            {"<leader>fn", mode = "n"},
            {"<leader>fb", mode = "n"},
        },
        event = "CmdLineEnter",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                        }
                    }
                }
            })
            require("telescope").load_extension("ui-select")
        end
    },
}
