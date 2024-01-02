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
                    "tsserver",
                    "pyright",
                    "cssls",
                    "emmet_ls",
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
                capabilities = lsp_capabilities,
            })

            lspconfig.rust_analyzer.setup({
                capabilities = lsp_capabilities,
            })

            lspconfig.tsserver.setup({
                capabilities = lsp_capabilities,
            })

            lspconfig.pyright.setup({
                on_attach = attach
            })

            lspconfig.cssls.setup({
                capabilities = lsp_capabilities,
            })

            lspconfig.emmet_ls.setup({
                capabilities = lsp_capabilities,
                filetypes = { "css", "html", "csss", "sass", "typescriptreact" },
            })

            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {} )
            vim.keymap.set({ 'n' }, '<leader>ca', vim.lsp.buf.code_action, {} )
        end
    }
}
