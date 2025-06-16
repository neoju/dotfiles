return {
  "folke/snacks.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    image = { enable = true },
    statuscolumn = {
      enabled = true,
    },
    explorer = {
      enabled = true,
      replace_netrw = true,
    },
    picker = {
      enabled = true,
      sources = {
        explorer = {
          ignored = false,
          hidden = true,
          layout = {
            layout = {
              width = 30,
            },
          },
        },
      },
    },
  },
  keys = {
    {
      "<leader>fe",
      function()
        local explorer = Snacks.picker.get({ source = "explorer" })[1] or Snacks.explorer()
        explorer:focus()
      end,
      desc = "Toggle Explorer Snacks",
    },
    { "<leader>e", "<leader>fe", desc = "Explorer Snacks", remap = true },
  },
}
