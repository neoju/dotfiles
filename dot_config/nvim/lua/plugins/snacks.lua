vim.pack.add({
	"https://github.com/folke/snacks.nvim",
}, { confirm = false })

local snacks = require("snacks")
snacks.setup({
	input = { enabled = true },
	scroll = { enabled = true },
	notifier = { enabled = true },
	terminal = { enabled = true },
	indent = { enabled = true },
	scope = { enabled = true },
	zen = { enabled = true },
	statuscolumn = { enabled = true },
	scratch = {
		enabled = true,
		win = {
			keys = {
				["del"] = {
					"<c-bs>",
					function(self)
						local file_path = vim.api.nvim_buf_get_name(self.buf)
						vim.cmd([[close]])
						vim.fn.delete(file_path)

						snacks.scratch.select()
					end,
					desc = "delete",
					mode = { "n" },
				},
				["back"] = {
					"<esc>",
					function()
						vim.cmd([[close]])
						snacks.scratch.select()
					end,
					desc = "back",
					mode = { "n" },
				},
			},
		},
	},
	picker = {
		win = {
			input = {
				keys = {
					["<S-Tab>"] = { "list_up", mode = { "i", "n" } },
					["<Tab>"] = { "list_down", mode = { "i", "n" } },
				},
			},
		},
		list = {
			keys = {
				["<S-Tab>"] = { "list_up", mode = { "i", "n" } },
				["<Tab>"] = { "list_down", mode = { "i", "n" } },
			},
		},
	},
})

local map = vim.keymap.set

map("n", "<C-'>", snacks.terminal.toggle, { desc = "Toggle Terminal" })

map("n", "<leader>.", function()
	snacks.scratch()
end, { desc = "Toggle Scratch Buffer" })

map("n", "<leader>S", function()
	snacks.scratch.select()
end, { desc = "Toggle Scratch Buffer" })

map("n", "<leader>z", function()
	snacks.zen()
end, { desc = "Toggle zen mode" })
