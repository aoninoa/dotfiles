return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	lazy = true,
	keys = {
		{ mode = "n", "<leader>ff" },
		{ mode = "n", "<leader>fg" },
		{ mode = "n", "<leader>fb" },
	},
	config = function()
		local builtin = require("telescope.builtin")
		local actions = require("telescope.actions")

		require("telescope").setup({
			defaults = {
				preview = false,
				mappings = {
					i = {
						["<C-j>"] = actions.select_default,
					},
				},
			},
		})

		vim.keymap.set("n", "<leader>ff", function()
			require("telescope.builtin").find_files(
				require("telescope.themes").get_ivy({
					layout_config = { height = 15 },
				})
			)
		end, {})
		vim.keymap.set("n", "<leader>fg", function()
			require("telescope.builtin").live_grep(
				require("telescope.themes").get_ivy({
					layout_config = { height = 15 },
				})
			)
		end, {})
		vim.keymap.set("n", "<leader>fb", function()
			require("telescope.builtin").buffers(
				require("telescope.themes").get_ivy({
					layout_config = { height = 15 },
				})
			)
		end, {})
	end,
}
