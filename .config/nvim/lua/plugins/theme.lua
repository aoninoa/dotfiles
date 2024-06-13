return {
    {
        "sainnhe/gruvbox-material",
        lazy = false,
        priority = 1000,
        enabled = false,
        config = function()
            vim.g.gruvbox_material_disable_italic_comment = 1
            vim.cmd.colorscheme("gruvbox-material")
        end
    },
    {
        "RRethy/base16-nvim",
        lazy = false,
        priority = 1000,
        enabled = true,
        config = function()
            require("base16-colorscheme")
            vim.cmd("colorscheme base16-ia-dark")
        end
    },
}
