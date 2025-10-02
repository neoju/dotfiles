-- Read volt files as php
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.volt" },
	callback = function()
		vim.bo.filetype = "html"
	end,
})

-- Map <esc> to close buffer in normal mode for specific filetypes
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("QuitBufferWithESC", { clear = true }),
	pattern = { "qf", "grug-far" },
	callback = function()
		vim.keymap.set("n", "<ESC>", "<CMD>bd<CR>", { buffer = true, silent = true })
	end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
	end,
})
