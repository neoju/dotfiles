vim.pack.add({ { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master" } })

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.volt",
	callback = function()
		vim.bo.filetype = "volt"
	end,
})

vim.treesitter.language.register('html', 'volt')

require("nvim-treesitter.configs").setup {
	auto_install = true,
	highlight = { enable = true },
	indent = { enable = true },
	ensure_installed = {
		-- system
		"lua",
		"go",
		"rust",

		-- web
		"html",
		"typescript",
		"javascript",
		"vue"
	}
}
