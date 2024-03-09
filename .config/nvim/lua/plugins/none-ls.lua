return {
    lazy = true,
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
                null_ls.builtins.diagnostics.eslint_d,

                -- C C++
                null_ls.builtins.formatting.clang_format,

                -- Go
                null_ls.builtins.formatting.gofumpt,
                null_ls.builtins.formatting.goimports_reviser,

                -- python
                null_ls.builtins.formatting.black,
                null_ls.builtins.diagnostics.ruff,
            }
        })
        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end
}
