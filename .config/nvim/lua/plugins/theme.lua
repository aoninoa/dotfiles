return {
    {
        "RRethy/base16-nvim",
        lazy = false,
        priority = 1000,
        enabled = true,
        config = function()
            require("base16-colorscheme")
            vim.cmd("colorscheme base16-ia-dark")
        end
    },
    {
        "navarasu/onedark.nvim",
        lazy = false,
        priority = 1000,
        enabled = false,
        config = function()
            local onedark = require("onedark")
            onedark.setup({
                style = "dark",
                code_style = {
                    comments = "none",
                    keywords = "none",
                    functions = "none",
                    strings = "none",
                    variables = "none",
                }
            })
            onedark.load()
        end,
    },
}
