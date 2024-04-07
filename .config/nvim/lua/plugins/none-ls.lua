return {
    lazy = true,
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    keys = {
        { "<leader>gf", "n" }
    },
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                -- Lua
                null_ls.builtins.formatting.stylua,

                -- TS JS
                null_ls.builtins.formatting.prettier,

                -- C C++
                null_ls.builtins.formatting.clang_format,

                -- Go
                null_ls.builtins.formatting.gofumpt,
                null_ls.builtins.formatting.goimports_reviser,

                -- python
                null_ls.builtins.formatting.black,
            }
        })
        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end
}
