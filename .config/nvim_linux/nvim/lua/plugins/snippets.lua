return {
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        lazy = true,
        event = "InsertEnter",
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end
    },
    {
        "saadparwaiz1/cmp_luasnip",
        lazy = true,
        event = "InsertEnter",
    },
}
