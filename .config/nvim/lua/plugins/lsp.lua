vim.pack.add {
	{ src = 'https://github.com/neovim/nvim-lspconfig' },

	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim"
}

require('mason').setup()
require("mason-lspconfig").setup {
	ensure_installed = {
		"lua_ls",
		"vue_ls",
		"ts_ls"
	},
}

vim.lsp.config('lua_ls', {
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			},
			diagnostics = {
				globals = {
					'vim',
					'require'
				},
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
		},
	},
})

local mason_packages = vim.fn.stdpath("data") .. "/mason/packages"
local vuels_path = mason_packages .. "/vue-language-server/node_modules/@vue/language-server"
vim.lsp.config('ts_ls', {
	filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
	init_options = {
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = vuels_path,
				languages = { "vue" },
			},
		},
	},
	settings = {
		typescript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = true,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayVariableTypeHintsWhenTypeMatchesName = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			},
		},
	},
})

vim.lsp.config('vue_ls', {
	-- root_dir = require("lspconfig").util.root_pattern(
	-- 	"vue.config.js",
	-- 	"vue.config.ts",
	-- 	"nuxt.config.js",
	-- 	"nuxt.config.ts"
	-- ),

	init_options = {
		vue = {
			hybridMode = true,
		},
	},
	settings = {
		typescript = {
			inlayHints = {
				enumMemberValues = {
					enabled = true,
				},
				functionLikeReturnTypes = {
					enabled = true,
				},
				propertyDeclarationTypes = {
					enabled = true,
				},
				parameterTypes = {
					enabled = true,
					suppressWhenArgumentMatchesName = true,
				},
				variableTypes = {
					enabled = true,
				},
			},
		},
	}
})
