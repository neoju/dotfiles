vim.pack.add({
	{
		src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',
		version = vim.version.range('3')
	},
	-- dependencies
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
	-- optional, but recommended
	"https://github.com/nvim-tree/nvim-web-devicons",
})

local map = vim.keymap.set
local neotree = require('neo-tree')

neotree.setup({
	-- options go here
	popup_border_style = "",
	window = {
		position = "left",
		width = 35,
	},
	filesystem = {
		follow_current_file = {
			enabled = true, -- Automatically focus the current file in Neo-tree
		},
		use_libuv_file_watcher = true
	},
	buffers = {
		follow_current_file = {
			enabled = true,
		},
	}
})

map('n', '<leader>e', '<CMD>Neotree<CR>', { desc = 'Explorer' })
