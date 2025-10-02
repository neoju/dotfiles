vim.pack.add({
	-- dependencies
	"https://github.com/nvim-lua/plenary.nvim",

	"https://github.com/kdheepak/lazygit.nvim",
}, { confirm = false })

local map = vim.keymap.set

map("n", "<leader>gb", "<CMD>Gitsigns blame_line<CR>", { desc = "Blame line" })
map("n", "<leader>ghs", "<CMD>Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })
map("n", "<leader>ghr", "<CMD>Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })

map("n", "<leader>gg", function()
	require("lazygit").lazygit()

	-- disable smear cursor when lazygit is open
	if pcall(require, "smear_cursor") then
		require("smear_cursor").enabled = false
	end
end, { desc = "Lazy Git" })
