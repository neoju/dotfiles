vim.pack.add({
	"https://github.com/mfussenegger/nvim-lint",
}, { confirm = false })

local lint = require("lint")

lint.linters_by_ft = {
	-- JavaScript/TypeScript/Vue
	javascript = { "eslint_d" },
	javascriptreact = { "eslint_d" },
	typescript = { "eslint_d" },
	typescriptreact = { "eslint_d" },
	vue = { "eslint_d" },
	-- CSS
	css = { "stylelint" },
	scss = { "stylelint" },
}

function Debounce(ms, fn)
	local timer = vim.uv.new_timer()
	return function(...)
		local argv = { ... }

		if not timer then
			return
		end

		timer:start(ms, 0, function()
			timer:stop()
			vim.schedule_wrap(fn)(unpack(argv))
		end)
	end
end

vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
	group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
	callback = function()
		Debounce(100, function()
			-- check if the root folder have no eslint config file
			if vim.fn.glob(".eslintrc*") == "" or vim.fn.glob("eslint.config.*") == "" then
				return
			end

			lint.try_lint()
		end)()
	end,
})
