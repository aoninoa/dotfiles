return {
	"simrat39/rust-tools.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"nvim-lua/plenary.nvim",
		"mfussenegger/nvim-dap",
	},
    lazy = true,
    ft = {
        "rust",
    },
	config = function()
		require("rust-tools").setup({})
        vim.keymap.set('n', '<leader>t', require("rust-tools").open_cargo_toml.open_cargo_toml, { silent = true, noremap = true})
	end,
}
