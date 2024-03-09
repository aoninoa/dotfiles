return {
    "norcalli/nvim-colorizer.lua",
    lazy = true,
    ft = {
        "css",
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
    },
    config = function ()
        require("colorizer").setup({
            "css",
            "javascript",
            "typescript",
        })
    end
}
