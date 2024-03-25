return {
    {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-path",
        },
        lazy = true,
        event = "InsertEnter",
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            local select_opts = { behavior = cmp.SelectBehavior.Select }

            cmp.setup({
                window = {
                    documentation = cmp.config.window.bordered(),
                },
                experimental = {
                    ghost_text = false,
                },
                formatting = {
                    fileds = { "menu", "abbr", "kind" },
                    format = function(entry, item)
                        local menu_icon = {
                            nvim_lsp = "λ",
                            luasnip = "⋗",
                            buffer = "Ω",
                            path = "🖫",
                        }

                        item.menu = menu_icon[entry.source.name]
                        return item
                    end,
                },
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = {
                    ["<Up>"] = cmp.mapping.select_prev_item(select_opts),
                    ["<Down>"] = cmp.mapping.select_next_item(select_opts),

                    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-d>"] = cmp.mapping.scroll_docs(4),

                    ["<C-e>"] = cmp.mapping.abort(),

                    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                    ["<CR>"] = cmp.mapping.confirm({ select = false }),

                    ["<Tab>"] = cmp.mapping(function(fallback)
                        local col = vim.fn.col(".") - 1

                        if cmp.visible() then
                            cmp.select_next_item(select_opts)
                        elseif col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
                            fallback()
                        else
                            cmp.complete()
                        end
                    end, { "i", "s" }),
                    ["<C-n>"] = cmp.mapping(function(fallback)
                        local col = vim.fn.col(".") - 1

                        if cmp.visible() then
                            cmp.select_next_item(select_opts)
                        elseif col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
                            fallback()
                        else
                            cmp.complete()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item(select_opts)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<C-p>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item(select_opts)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                },
                sources = {
                    { name = "path" },
                    { name = "nvim_lsp", keyword_length = 1 },
                    { name = "buffer",   keyword_length = 3 },
                    { name = "luasnip",  keyword_length = 2 },
                },
            })
            vim.opt.completeopt = { "menu", "menuone", "noselect" }
        end,
    },
    {
        "hrsh7th/cmp-nvim-lsp",
        config = function()
            require("cmp_nvim_lsp").setup()
        end,
    },
}
