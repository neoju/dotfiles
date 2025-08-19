vim.pack.add {
	"https://github.com/zbirenbaum/copilot.lua",
	"https://github.com/giuxtaposition/blink-cmp-copilot"
}

require('copilot').setup({
	suggestion = {
		enabled = false
	},
	panel = {
		enabled = false
	},
})
