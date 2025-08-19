-- Read volt files as php
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.volt" },
	callback = function()
		vim.bo.filetype = "html"
	end,
})

-- Format on save
vim.api.nvim_create_autocmd('BufWritePre', {
	callback = function()
		vim.lsp.buf.format()
	end,
})
