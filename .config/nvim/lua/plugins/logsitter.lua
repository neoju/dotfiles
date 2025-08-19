vim.pack.add({ "https://github.com/gaelph/logsitter.nvim" })

local map = vim.keymap.set
local logsitter = require('logsitter')

logsitter.setup({
	path_format = "fileonly",
	prefix = " ->",
	separator = "->",
})

map('n', '<leader>lg', function() logsitter.log() end)
map('x', '<leader>lg', function() logsitter.log_visual() end)
