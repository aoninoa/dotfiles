return {
    "nvim-treesitter/nvim-treesitter",
    commit = "c11d49c",
    build = function()
        vim.cmd("TSUpdate")
    end,
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "comment",
                "lua",
                "c",
                "cpp",
                "cmake",
                "make",
                "vimdoc",
                "json",
                "markdown",
                "markdown_inline",
                "javascript",
                "typescript",
                "rust",
                "python",
                "vimdoc",
                "tsx",
                "json",
                "html",
                "css",
                "go",
                "markdown",
                "markdown_inline",
                "commonlisp",
                "zig",
                "bash",
                "prisma",
            },
            auto_install = true,
            endwise = { enable = true },
            highlight = { enable = true },
            indent = { enable = true },
            autotag = { enable = true },
        })
    end,
}
