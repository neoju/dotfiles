return {
  "folke/snacks.nvim",
  opts = {
    terminal = {
      enabled = true,
    },
    picker = {
      win = {
        input = {
          keys = {
            ["<S-Tab>"] = { "list_up", mode = { "i", "n" } },
            ["<Tab>"] = { "list_down", mode = { "i", "n" } },
          },
        },
      },
      list = {
        keys = {
          ["<S-Tab>"] = { "list_up", mode = { "i", "n" } },
          ["<Tab>"] = { "list_down", mode = { "i", "n" } },
        },
      },
    },
  },
}
