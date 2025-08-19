vim.pack.add({
	{ src = "https://github.com/echasnovski/mini.pick", version = "stable" },
})

local map = vim.keymap.set

require('mini.pick').setup({
	window = {
		config = {
			-- Floating window configuration
			anchor = 'NW',      -- Anchor to top-left corner
			col = math.floor(vim.o.columns * 0.1), -- 10% from left edge
			row = math.floor(vim.o.lines * 0.1), -- 10% from top edge
			width = math.floor(vim.o.columns * 0.8), -- 80% of window width
			height = math.floor(vim.o.lines * 0.8), -- 80% of window height
			border = 'single',  -- Border style: 'none', 'single', 'double', 'rounded', etc.
			relative = 'editor', -- Float relative to editor
			zindex = 99,        -- Ensure picker is on top
		},
	},
	mappings = {
		move_down = '<Tab>',
		move_up = '<S-Tab>',

		toggle_info = '<C-i>',
		toggle_preview = '<C-p>',
	}
})

map('n', '<leader>ff', '<CMD>Pick files<CR>', { desc = 'Find files' })
map('n', '<leader>ft', '<CMD>Pick grep_live<CR>', { desc = 'Find text (grep live)' })
map('n', '<leader>fc', '<CMD>Pick commands<CR>', { desc = 'Find commands' })
