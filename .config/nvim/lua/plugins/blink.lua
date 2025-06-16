return {
  "saghen/blink.cmp",
  dependencies = {
    "brenoprata10/nvim-highlight-colors",
    "Kaiser-Yang/blink-cmp-avante",
  },

  opts = {
    completion = {
      accept = {
        auto_brackets = {
          enabled = true,
        },
      },

      menu = {
        draw = {
          components = {
            -- customize the drawing of kind icons
            kind_icon = {
              text = function(ctx)
                -- default kind icon
                local icon = ctx.kind_icon
                -- if LSP source, check for color derived from documentation
                if ctx.item.source_name == "LSP" then
                  local color_item =
                    require("nvim-highlight-colors").format(ctx.item.documentation, { kind = ctx.kind })
                  if color_item and color_item.abbr ~= "" then
                    icon = color_item.abbr
                  end
                end
                return icon .. ctx.icon_gap
              end,
              highlight = function(ctx)
                -- default highlight group
                local highlight = "BlinkCmpKind" .. ctx.kind
                -- if LSP source, check for color derived from documentation
                if ctx.item.source_name == "LSP" then
                  local color_item =
                    require("nvim-highlight-colors").format(ctx.item.documentation, { kind = ctx.kind })
                  if color_item and color_item.abbr_hl_group then
                    highlight = color_item.abbr_hl_group
                  end
                end
                return highlight
              end,
            },
          },
        },

        auto_show = function(ctx)
          if ctx.mope == "cmdline" then
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
      default = { "avante", "lsp", "path", "buffer" },
      providers = {
        avante = {
          module = "blink-cmp-avante",
          name = "Avante",
          opts = {
            -- options for blink-cmp-avante
          },
        },
      },
    },

    keymap = {
      preset = "enter",
      ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
    },
  },
}
