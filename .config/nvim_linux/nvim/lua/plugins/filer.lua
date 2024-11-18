return {
    "nvim-tree/nvim-tree.lua",

    config = function()
        local on_attach = function(bufnr)
            local api = require("nvim-tree.api")
            local opts = { silent = true, noremap = true, buffer = bufnr }

            api.config.mappings.default_on_attach(bufnr)
        end

        require("nvim-tree").setup({
            view = {
                width = 30,
            },
            renderer = {
                highlight_bookmarks = "name",

                icons = {
                    show = {
                        file = false,
                        folder = false,
                        folder_arrow = false,
                        git = false,
                        modified = false,
                        diagnostics = false,
                        bookmarks = false,
                    }

                }
            },
            actions = {
                open_file = {
                    quit_on_open = true

                }
            },
            on_attach = on_attach,
        })


        vim.keymap.set(
            "n",

            "<leader>r",
            "<CMD>NvimTreeClose<CR>",
            { silent = true, noremap = true }
        )
        vim.api.nvim_create_user_command("E", "NvimTreeOpen", {})
    end,
}

