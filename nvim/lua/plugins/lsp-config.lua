return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    -- Install Lnguage Servers.
                    "lua_ls",
                    "clangd",
                    "rust_analyzer",
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
            lspconfig.lua_ls.setup({
                capabilities = lsp_capabilities,
           })

            lspconfig.clangd.setup({
                capabilities = lsp_capabilities
            })

            lspconfig.rust_analyzer.setup({
                capabilities = lsp_capabilities
            })

            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {} )
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {} )
            vim.keymap.set({ 'n' }, '<leader>ca', vim.lsp.buf.code_action, {} )
        end
    }
}
