vim.pack.add({
	-- dependencies
	"https://github.com/nvim-treesitter/nvim-treesitter-textobjects",

	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master" },
}, { confirm = false })

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.volt",
	callback = function()
		vim.bo.filetype = "volt"
	end,
})

vim.treesitter.language.register("html", "volt")

require("nvim-treesitter.configs").setup({
	auto_install = true,
	highlight = { enable = true },
	indent = { enable = true },
	ensure_installed = {
		-- system
		"lua",
		"go",
		"rust",

		-- web
		"html",
		"typescript",
		"javascript",
		"vue",
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				-- You can optionally set descriptions to the mappings (used in the desc parameter of
				-- nvim_buf_set_keymap) which plugins like which-key display
				["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
				-- You can also use captures from other query groups like `locals.scm`
				["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
			},
		},
	},
	modules = {},
	ignore_install = {},
	sync_install = false,
})
