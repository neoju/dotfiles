vim.pack.add({
	-- dependencies
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",

	{
		src = "https://github.com/nvim-neo-tree/neo-tree.nvim",
		version = vim.version.range("3"),
	},
}, { confirm = false })

local map = vim.keymap.set
local neotree = require("neo-tree")

neotree.setup({
	-- options go here
	popup_border_style = "",
	window = {
		position = "left",
		width = 35,
		mappings = {
			["y"] = "", -- unmap y to avoid conflicts
			["yi"] = "yank_relative_path",
			["yy"] = "copy_to_clipboard", -- copy node name
		},
	},
	filesystem = {
		follow_current_file = {
			enabled = true, -- Automatically focus the current file in Neo-tree
		},
		use_libuv_file_watcher = true,
		commands = {
			yank_relative_path = function(state)
				local node = state.tree:get_node()
				if not node or not node.path then
					return
				end

				local relative_path = vim.fn.fnamemodify(node.path, ":.")
				vim.fn.setreg("+", relative_path)

				local notify_id = MiniNotify.add("Yanked relative path: " .. relative_path)
				vim.defer_fn(function()
					MiniNotify.remove(notify_id)
				end, 1000)
			end,
		},
	},
	buffers = {
		follow_current_file = {
			enabled = true,
		},
	},
})

map("n", "<leader>e", "<CMD>Neotree<CR>", { desc = "Explorer" })
