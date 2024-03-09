return {
	"FotiadisM/tabset.nvim",
    lazy = true,
    event = "InsertEnter",
	config = function()
		require("tabset").setup({
			defaults = {
				tabwidth = 4,
				expandtab = true,
			},
			languages = {
				{
					filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "json", "yaml" },
					config = {
						tabwidth = 2,
						expandtab = true,
					},
				},
				{
					filetypes = { "make" },
					config = {
						tabwidth = 4,
						expandtab = false,
					},
				},
			},
		})
	end,
}
