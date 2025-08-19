vim.pack.add {
	-- for image preview
	"https://github.com/folke/snacks.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",

	"https://github.com/ibhagwan/fzf-lua",
}

local fzf_lua = require('fzf-lua')
local map = vim.keymap.set

fzf_lua.register_ui_select()
fzf_lua.setup({
	keymap = {
		fzf = {
			["tab"] = "down",
			["shift-tab"] = "up",
		},
	},
})

map('n', '<leader>ff', '<CMD>FzfLua files<CR>', { desc = 'Find files' })
map('n', '<leader>fs', '<CMD>FzfLua live_grep<CR>', { desc = 'Find string (live_grep)' })
map('n', '<leader>fr', '<CMD>FzfLua live_grep resume=true<CR>', { desc = 'Find string (live_grep) - resume' })
map('n', '<leader>ft', '<CMD>TodoFzfLua<CR>', { desc = 'Find todo' })
map('n', '<leader>fd', '<CMD>FzfLua diagnostics_document<CR>', { desc = 'Find diagnostics (document)' })
map('n', '<leader>fD', '<CMD>FzfLua diagnostics_workspace<CR>', { desc = 'Find diagnostics (workspace)' })
