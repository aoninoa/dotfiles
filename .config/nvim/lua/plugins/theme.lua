return {
    {
        "navarasu/onedark.nvim",
        lazy = false,
        priority = 1000,
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
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        enabled = false,
        config = function()
            local gruv = require("gruvbox")
            gruv.setup({
                bold = false,
                italic = {
                    strings = false,
                    emphasis = false,
                    comments = false,
                    operators = false,
                    folds = false,
                },
            })
            gruv.load()
        end,
    }
}
