vim.pack.add({
	"https://github.com/MagicDuck/grug-far.nvim",
}, { confirm = false })

local map = vim.keymap.set
local grug_far = require("grug-far")

grug_far.setup({
	transient = true,
	windowCreationCommand = "botright vsplit",
})

-- search and replace
map("n", "<leader>sS", function()
	grug_far.open({
		prefills = {
			search = vim.fn.expand("<cword>"),
		},
	})
end, { desc = "Search and Replace current word" })

map({ "n", "x" }, "<leader>ss", function()
	grug_far.open({
		prefills = {
			paths = vim.fn.expand("%"),
			search = vim.fn.expand("<cword>"),
		},
	})
end, { desc = "Search and Replace current word - in file" })

map({ "x" }, "<leader>si", function()
	grug_far.open({
		visualSelectionUsage = "operate-within-range",
	})
end, { desc = "Search and Replace within range" })
