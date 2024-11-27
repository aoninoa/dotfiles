return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "clangd",
                    "pyright",
                    "rust_analyzer",
                    "zls",
                    "gopls",
                    "ts_ls",
                    "prismals",
                    "cmake",
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- Start neodev
            -- It must be called before setting up lua-lsp
            require("neodev").setup({})

            -- Import modules
            local lspconfig = require("lspconfig")
            local lsp_capabilities = vim.lsp.protocol.make_client_capabilities()

            lsp_capabilities =
                require("cmp_nvim_lsp").default_capabilities(lsp_capabilities)

            -- Set border type
            -- Enabled border types
            -- "none"
            -- "single"
            -- "double"
            -- "rounded"
            local _border = "single"

            -- configure floating window border
            vim.lsp.handlers["textDocument/hover"] =
                vim.lsp.with(vim.lsp.handlers.hover, {
                    border = _border,
                })
            vim.lsp.handlers["textDocument/signatureHelp"] =
                vim.lsp.with(vim.lsp.handlers.hover, {
                    border = _border,
                })
            vim.diagnostic.config({
                float = { border = _border },
            })


            -- from
            -- "https://github.com/neovim/nvim-lspconfig#suggested-configuration"
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local opts =
                    { silent = true, noremap = true, buffer = ev.buf }
                    vim.keymap.set(
                        "n",
                        "<leader>gD",
                        vim.lsp.buf.declaration,
                        opts
                    )
                    vim.keymap.set(
                        "n",
                        "<leader>gd",
                        vim.lsp.buf.definition,
                        opts
                    )
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set(
                        "n",
                        "<leader>gi",
                        vim.lsp.buf.implementation,
                        opts
                    )
                    vim.keymap.set(
                        "n",
                        "<leader>k",
                        vim.lsp.buf.signature_help,
                        opts
                    )
                    vim.keymap.set(
                        "n",
                        "<leader>wa",
                        vim.lsp.buf.add_workspace_folder,
                        opts
                    )
                    vim.keymap.set(
                        "n",
                        "<leader>wr",
                        vim.lsp.buf.remove_workspace_folder,
                        opts
                    )
                    vim.keymap.set("n", "<leader>wl", function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, opts)
                    vim.keymap.set(
                        "n",
                        "<leader>D",
                        vim.lsp.buf.type_definition,
                        opts
                    )
                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                    vim.keymap.set(
                        "n",
                        "<leader>xq",
                        vim.lsp.buf.code_action,
                        opts
                    )
                    vim.keymap.set(
                        "n",
                        "<leader>gr",
                        vim.lsp.buf.references,
                        opts
                    )
                    vim.keymap.set(
                        "n",
                        "<leader>xx",
                        vim.diagnostic.open_float,
                        opts
                    )
                end,
            })
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local bufnr = args.buf
                    local client = vim.lsp.get_client_by_id(args.data.client_id)

                    if vim.tbl_contains({ 'null-ls' }, client.name) then -- blacklist lsp
                        return
                    end
                    require("lsp_signature").on_attach({

                        doc_lines = 0,
                        hint_enable = false,
                        hi_parameter = "",
                        handler_opts = {
                            border = "single",
                        }
                    }, bufnr)
                end,
            })
            lspconfig["lua_ls"].setup({
                capabilities = lsp_capabilities,
            })

            lspconfig["clangd"].setup({
                capabilities = lsp_capabilities,
                cmd = {
                    "clangd",
                    "--offset-encoding=utf-16",
                    "-header-insertion=never",
                },
            })

            lspconfig["rust_analyzer"].setup({
                capabilities = lsp_capabilities,
            })

            lspconfig["pyright"].setup({
                capabilities = lsp_capabilities,
            })

            lspconfig["gopls"].setup({
                capabilities = lsp_capabilities,
            })

            lspconfig["zls"].setup({
                capabilities = lsp_capabilities,
            })

            lspconfig["ts_ls"].setup({
                capabilities = lsp_capabilities,
            })

            lspconfig["prismals"].setup({
                capabilities = lsp_capabilities,
            })

            lspconfig["cmake"].setup({
                capabilities = lsp_capabilities,
            })
        end,
    },
}
