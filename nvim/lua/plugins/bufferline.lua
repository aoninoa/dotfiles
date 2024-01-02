return {
    {
        "akinsho/bufferline.nvim",
        version = "*",
        requires = "nvim-tree/nvim-web-devicons",
        config = function()
            require("bufferline").setup({
                options = {
                    hover = {
                        enabled = true,
                        delay = 200,
                        reveal = { "close" }
                    },
                    mode = "tab",

                    color_icons = true
                }
            })
            vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
            vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
        end
    },
    {
       "famiu/bufdelete.nvim",
        config = function()
            local callback = function()
                require("bufdelete").bufdelete(0, false)
            end
            vim.keymap.set('n', '<Leader>z', callback, {})
        end
    }
}
