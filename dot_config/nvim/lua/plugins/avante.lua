vim.pack.add({
	-- dependencies
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/hakonharnes/img-clip.nvim",
	"https://github.com/MeanderingProgrammer/render-markdown.nvim",

	{ src = "https://github.com/yetone/avante.nvim" },
}, { confirm = false })

require("render-markdown").setup({
	file_types = { "markdown", "Avante" },
	completions = { blink = { enabled = true } },
})

require("img-clip").setup({
	default = {
		embed_image_as_base64 = false,
		prompt_for_file_name = false,
		drag_and_drop = {
			insert_mode = true,
		},
		-- required for Windows users
		use_absolute_path = true,
	},
})

local map = vim.keymap.set
local initialized = false

-- lazy load avante.nvim
map("n", "<leader>aa", function()
	if not initialized then
		require("avante").setup({
			-- Your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			provider = "gemini-2.5-pro",
			input = {
				provider = "snacks", -- "native" | "dressing" | "snacks"
				provider_opts = {
					-- Snacks input configuration
					title = "Avante Input",
					icon = " ",
					placeholder = "Enter your API key...",
				},
			},
		})
		initialized = true
	end

	vim.cmd("AvanteAsk")
end, { desc = "avante: ask" })
