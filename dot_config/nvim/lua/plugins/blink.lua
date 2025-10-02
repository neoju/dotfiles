vim.pack.add({
	-- dependencies
	"https://github.com/giuxtaposition/blink-cmp-copilot",
	{ src = "https://github.com/echasnovski/mini.icons", version = "stable" },

	{ src = "https://github.com/Saghen/blink.cmp" },
}, { confirm = false })

local blink = require("blink.cmp")
local mini_icons = require("mini.icons")

blink.setup({
	fuzzy = {
		prebuilt_binaries = {
			force_version = "v1.6.0",
		},
	},

	completion = {
		accept = {
			auto_brackets = {
				enabled = true,
			},
		},

		menu = {
			draw = {
				components = {
					kind_icon = {
						text = function(ctx)
							-- copilot does not have an icon in mini.icons
							if ctx.kind == "Copilot" then
								return ""
							end

							local kind_icon, _, _ = mini_icons.get("lsp", ctx.kind)
							return kind_icon
						end,
						-- (optional) use highlights from mini.icons
						highlight = function(ctx)
							local _, hl, _ = mini_icons.get("lsp", ctx.kind)
							return hl
						end,
					},
					kind = {
						-- (optional) use highlights from mini.icons
						highlight = function(ctx)
							local _, hl, _ = mini_icons.get("lsp", ctx.kind)
							return hl
						end,
					},
				},
			},

			auto_show = function(ctx)
				if ctx.mode == "cmdline" then
					return false
				end

				return not vim.tbl_contains({ "AvantePromptInput" }, vim.bo.filetype)
					and vim.bo.buftype ~= "prompt"
					and vim.bo.buftype ~= "nofile"
					and vim.b.completion ~= false
			end,
		},
	},

	sources = {
		default = { "lsp", "path", "snippets", "buffer", "copilot" },
		providers = {
			copilot = {
				name = "copilot",
				module = "blink-cmp-copilot",
				score_offset = 100,
				async = true,
			},
		},
	},

	keymap = {
		preset = "enter",
		["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
		["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
	},
})
