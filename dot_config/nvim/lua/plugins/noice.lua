vim.pack.add({
	"https://github.com/folke/noice.nvim",
})

require("noice").setup({
	lsp = {
		-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
		},
	},
	cmdline = {
		enabled = true,
		view = "cmdline_popup", -- This enables the fancy floating popup for cmd input
		opts = {
			-- Optional: Customize popup options (e.g., position, size)
			position = {
				row = 5,
			},
		},
	},
})
