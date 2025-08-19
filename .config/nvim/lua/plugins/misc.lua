vim.pack.add({
	{ src = "https://github.com/echasnovski/mini.surround",    version = "stable" },
	{ src = "https://github.com/echasnovski/mini.icons",       version = "stable" },
	{ src = "https://github.com/echasnovski/mini.statusline",  version = "stable" },
	{ src = "https://github.com/echasnovski/mini.notify",      version = "stable" },
	{ src = "https://github.com/echasnovski/mini.pairs",       version = "stable" },
	{ src = "https://github.com/echasnovski/mini.hipatterns",  version = "stable" },
	{ src = "https://github.com/echasnovski/mini.indentscope", version = "stable" },
	{ src = "https://github.com/echasnovski/mini.bracketed",   version = "stable" },
	"https://github.com/karb94/neoscroll.nvim",
	"https://github.com/gbprod/cutlass.nvim",
	"https://github.com/folke/todo-comments.nvim"
})

require('mini.surround').setup()
require('mini.icons').setup()
require('mini.statusline').setup()
require('mini.notify').setup()
require('mini.pairs').setup()
require('mini.hipatterns').setup()
require('mini.indentscope').setup()
require('mini.bracketed').setup()
require('todo-comments').setup()

require('neoscroll').setup({ mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>' } })
require('cutlass').setup({ cut_key = 'x' })
