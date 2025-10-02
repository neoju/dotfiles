vim.pack.add({
	"https://github.com/stevearc/conform.nvim",
}, { confirm = false })

local conform = require("conform")
local map = vim.keymap.set

conform.setup({
	format_on_save = function(bufnr)
		-- Disable with a global or buffer-local variable
		if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
			return
		end

		return {
			timeout_ms = 500,
			lsp_format = "fallback",
			stop_after_first = true,
		}
	end,

	formatters_by_ft = {
		-- JavaScript/TypeScript
		javascript = { "prettierd", "prettier" },
		javascriptreact = { "prettierd", "prettier" },
		typescript = { "prettierd", "prettier" },
		typescriptreact = { "prettierd", "prettier" },
		vue = { "eslint_stylistic", "prettierd", "prettier" },
		-- CSS/SCSS
		css = { "prettierd", "prettier" },
		scss = { "prettierd", "prettier" },
		less = { "prettierd", "prettier" },
		-- JSON/YAML
		json = { "prettierd", "prettier" },
		jsonc = { "prettierd", "prettier" },
		yaml = { "prettierd", "prettier" },
		-- Markdown/HTML
		markdown = { "prettierd", "prettier" },
		html = { "prettierd", "prettier" },
		-- Other formats
		lua = { "stylua" },
		python = { "black" },
		go = { "goimports", "gofumpt" },
	},

	formatters = {
		eslint_stylistic = {
			command = "eslint_d",
			args = {
				"--stdin",
				"--fix-to-stdout",
				"--stdin-filename",

				"$FILENAME",
			},
			exit_codes = { 0, 1 },
			stdin = true,
			require_cwd = true,
			env = {
				ESLINT_D_PPID = vim.fn.getpid(),
				ESLINT_USE_FLAT_CONFIG = true,
				ESLINT_D_LOCAL_ESLINT_ONLY = true,
			},

			-- A function that calculates the directory to run the command in
			cwd = require("conform.util").root_file({
				"eslint.config.mjs",
				"eslint.config.js",
			}),
		},
	},
})

map("n", "<leader>cF", function()
	vim.g.disable_autoformat = not vim.g.disable_autoformat
	Snacks.notify("Autoformatting " .. (vim.g.disable_autoformat and "disabled" or "enabled"))
end, { desc = "Toggle Autoformatting" })
