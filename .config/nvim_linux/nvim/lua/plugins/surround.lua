return {
    "kylechui/nvim-surround",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    version = "*",
    event = "VeryLazy",
    config = function()
        local opts = { silent = true, noremap = true }
        require("nvim-surround").setup({
            aliases = {
                [">"] = ">",
                [")"] = ")",
                ["}"] = "}",
                ["]"] = "]",
                ['"'] = { '"', "'", "`" },
                ["s"] = { "}", "]", ")", "]", '"', "'", "`" },
            },
        })
    end,
}
