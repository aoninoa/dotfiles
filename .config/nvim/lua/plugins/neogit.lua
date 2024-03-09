return {
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"nvim-telescope/telescope.nvim",
		},
		lazy = true,
		cmd = {
			"Neogit",
			"NeogitResetState",
		},
		config = function()
			require("neogit").setup()
		end,
	},
}
