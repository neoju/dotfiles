---@class lazyvim.util.toggle
local M = require("lazyvim.util.toggle")

return {
  "stevearc/conform.nvim",
  optional = true,
  ---@class opts ConformOpts
  opts = function(_, opts)
    M._prettier_enabled = true

    M.prettier = M.wrap({
      name = "Prettier",
      get = function()
        return M._prettier_enabled == true
      end,
      set = function(state)
        M._prettier_enabled = state
      end,
    })

    M.map("<leader>cp", M.prettier)

    opts.formatters = opts.formatters or {}
    opts.formatters.prettier = {
      condition = function()
        return M._prettier_enabled == true
      end,
    }
  end,
}
