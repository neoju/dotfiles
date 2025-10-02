vim.pack.add({
	"https://github.com/gaelph/logsitter.nvim",
}, { confirm = false })

local logsitter = require("logsitter")

logsitter.setup({
	path_format = "fileonly",
	prefix = " ->",
	separator = "->",
})

-- set keymaps
local map = vim.keymap.set

map("n", "<leader>lg", logsitter.log, { desc = "Logsitter" })
map("x", "<leader>lg", logsitter.log_visual, { desc = "Logsitter - visual" })
