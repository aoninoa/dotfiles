return {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000, config = function()
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
}
