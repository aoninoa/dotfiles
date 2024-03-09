return {
    "folke/trouble.nvim",
    lazy = true,
    keys = {
        { "<leader>xx", mode = "n" },
        { "<leader>xw", mode = "n" },
        { "<leader>xd", mode = "n" },
        { "<leader>xl", mode = "n" },
    },
    config = function()
        local opts = { silent = true }
        require("trouble").setup({
            icons = false,
            signs = {
                -- icons / text used for a diagnostic
                error = "E:",
                warning = "W:",
                hint = "H:",
                information = "I:"
            },
        })
        vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end, opts)
        vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end, opts)
        vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end, opts)
        vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end, opts)
    end
}
