return {
	"nvimdev/lspsaga.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local opts = { silent = true, noremap = true }

		require("lspsaga").setup({
			border_style = "single",
			show_outline = {
				min_width = 50,
				auto_preview = false,
			},
		})

		vim.keymap.set("n", "<leader>xq", "<CMD>Lspsaga code_action<CR>", opts)
		vim.keymap.set("n", "<leader>gd", "<CMD>Lspsaga goto_definition<CR>", opts)
		vim.keymap.set("n", "<leader>ca", "<CMD>Lspsaga peek_definition<CR>", opts)
		vim.keymap.set("n", "K", "<CMD>Lspsaga hover_doc<CR>", opts)
	end,
}
