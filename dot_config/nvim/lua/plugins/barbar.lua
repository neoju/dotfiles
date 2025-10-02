vim.pack.add({
	-- dependencies
	"https://github.com/nvim-tree/nvim-web-devicons",

	"https://github.com/romgrk/barbar.nvim",
}, { confirm = false })

local barbar = require("barbar")
local map = vim.keymap.set

barbar.setup({
	auto_hide = false,
	focus_on_close = "previous", -- Focus the previous buffer when closing the current one
	sidebar_filetypes = {
		["neo-tree"] = true, -- Recognize Neo-tree as a sidebar
	},
})

map("n", "<S-h>", "<CMD>BufferPrevious<CR>")
map("n", "<S-l>", "<CMD>BufferNext<CR>")
map("n", "<leader>bo", "<CMD>BufferCloseAllButCurrent<CR>", { desc = "Close others" })
map("n", "<leader>bd", "<CMD>BufferClose<CR>", { desc = "Close current buffer" })
map("n", "<leader>bp", "<CMD>BufferPick<CR>", { desc = "Pick buffer" })
map("n", "<leader>bb", "<C-^>", { desc = "Back to last opened buffer" })
