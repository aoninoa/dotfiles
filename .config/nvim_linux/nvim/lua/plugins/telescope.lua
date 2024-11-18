return {
	{
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
			{ mode = "n", "<leader>fl" },
		},
		config = function()
			local builtin_actions = require("telescope.actions")
			require("telescope").setup({
				-- Default mapping
				defaults = {
					vimgrep_arguments = {
						"rg",
						"--hidden",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
					},
					mappings = {
						-- insert mode
						i = {
							["<C-j>"] = builtin_actions.select_default,
							["<C-o>"] = builtin_actions.select_horizontal,
						},
						-- normal mode
						n = {},
					},
				},
				extensions = {},
			})

			-- key mappings
			-- Open file_finder
			vim.keymap.set("n", "<leader>ff", function()
				require("telescope.builtin").find_files()
			end, {})

			-- Open live_grep
			vim.keymap.set("n", "<leader>fg", function()
				require("telescope.builtin").live_grep()
			end, {})

			-- Open buffer list
			vim.keymap.set("n", "<leader>fb", function()
				require("telescope.builtin").buffers()
			end, {})
		end,
	},
}
