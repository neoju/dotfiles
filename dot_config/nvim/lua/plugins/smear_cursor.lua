vim.pack.add({
	"https://github.com/sphamba/smear-cursor.nvim",
}, { confirm = false })

local smear_cursor = require("smear_cursor")

smear_cursor.setup({
	smear_between_buffers = true,
	smear_to_cmd = false,
	cursor_color = "#ff8800",
	stiffness = 0.3,
	trailing_stiffness = 0.1,
	trailing_exponent = 5,
	never_draw_over_target = true,
	hide_target_hack = true,
	gamma = 1,
	legacy_computing_symbols_support = true,
	smear_terminal_mode = true,
	time_interval = 5,
})

-- autocmd to enable smear cursor when leaving lazygit
vim.api.nvim_create_autocmd("BufLeave", {
	pattern = { "lazygit" },
	callback = function()
		smear_cursor.enabled = true
	end,
})

-- toggle smear cursor in terminal mode
vim.api.nvim_create_autocmd("TermEnter", {
	callback = function()
		smear_cursor.enabled = false
	end,
})
vim.api.nvim_create_autocmd("TermLeave", {
	callback = function()
		smear_cursor.enabled = true
	end,
})
