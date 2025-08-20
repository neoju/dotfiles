vim.pack.add {
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/romgrk/barbar.nvim"
}

local barbar = require('barbar')
local map = vim.keymap.set

barbar.setup({
	auto_hide = false,
	focus_on_close = "previous", -- Focus the previous buffer when closing the current one
	sidebar_filetypes = {
		["neo-tree"] = true, -- Recognize Neo-tree as a sidebar
	},
})

map('n', '<S-h>', '<CMD>BufferPrevious<CR>')
map('n', '<S-l>', '<CMD>BufferNext<CR>')
map('n', '<leader>bo', '<CMD>BufferCloseAllButCurrent<CR>', { desc = 'Close others' })
map('n', '<leader>bd', '<CMD>BufferClose<CR>', { desc = 'Close current buffer' })
map('n', '<leader>bp', '<CMD>BufferPick<CR>', { desc = 'Pick buffer' })

-- Save the last opened buffer id then we can back to that easily
local last_opened_buf_id = 0
vim.api.nvim_create_autocmd('BufLeave', {
	callback = function()
		last_opened_buf_id = vim.api.nvim_get_current_buf()
	end,
})

map('n', '<leader>bb', function()
	-- back to last opened buffer
	vim.api.nvim_set_current_buf(last_opened_buf_id)
end, { desc = 'Back to last opened buffer' })
