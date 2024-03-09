return {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        vim.cmd("TSUpdate")
    end,
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "lua",
                "c",
                "cpp",
                "cmake",
                "make",
                "javascript",
                "typescript",
                "rust",
                "python",
                "vimdoc",
                "tsx",
                "json",
                "html",
                "css",
                "scss",
                "nasm",
                "go",
                "markdown",
                "markdown_inline",
                "commonlisp",
                "zig",
                "haskell",
                "pascal",
                "perl",
                "ruby",
            },
            endwise = { enable = true },
            highlight = { enable = true },
            indent = { enable = true },
            autotag = { enable = true },
        })
    end,
}
