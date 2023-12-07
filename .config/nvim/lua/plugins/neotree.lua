local mappings = {
  ["o"] = "open",
  ["oc"] = false,
  ["od"] = false,
  ["og"] = false,
  ["om"] = false,
  ["on"] = false,
  ["os"] = false,
  ["ot"] = false,
  ["<leader>oc"] = { "order_by_created", nowait = false },
  ["<leader>od"] = { "order_by_diagnostics", nowait = false },
  ["<leader>og"] = { "order_by_git_status", nowait = false },
  ["<leader>om"] = { "order_by_modified", nowait = false },
  ["<leader>on"] = { "order_by_name", nowait = false },
  ["<leader>os"] = { "order_by_size", nowait = false },
  ["<leader>ot"] = { "order_by_type", nowait = false },
}

return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      mappings = mappings,
    },
  },
  keys = {
    { "<leader>e", "<cmd>Neotree focus<cr>", desc = "Neotree focus" },
  },
}
