vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/kdheepak/lazygit.nvim"
})

local map = vim.keymap.set

map('n', '<leader>gg', '<CMD>LazyGitCurrentFile<CR>', { desc = 'Lazy Git' })
