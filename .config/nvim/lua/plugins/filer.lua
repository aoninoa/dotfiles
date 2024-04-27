return {
    "nvim-tree/nvim-tree.lua",
    config = function()
        local on_attach = function(bufnr)
            local api = require("nvim-tree.api")
            local opts = { silent = true, noremap = true, buffer = bufnr }

            api.config.mappings.default_on_attach(bufnr)

            -- Custom mappings below --
        end

        require("nvim-tree").setup({
            view = {
                width = 40,
            },
            renderer = {
                highlight_bookmarks = "name",
            },
            actions = {
                open_file = {
                    quit_on_open = true
                }
            },
            filters = {
                dotfiles = true,
            },
            on_attach = on_attach,
        })

        vim.keymap.set(
            "n",
            "<leader>r",
            "<CMD>NvimTreeClose<CR>",
            { silent = true, noremap = true }
        )
        vim.api.nvim_create_user_command("Ex", "NvimTreeOpen", {})
    end,
}
