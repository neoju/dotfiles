return {
  {
    "brenoprata10/nvim-highlight-colors",
    opts = {
      render = "virtual",
      virtual_symbol = "",
    },
  },

  {
    -- Decorate scrollbar.
    "lewis6991/satellite.nvim",
    opts = {},
  },
  {
    -- Smooth scrolling for any movement command.
    "declancm/cinnamon.nvim",
    version = "*", -- use latest release
    opts = {},
    enabled = false,
  },
  {
    -- Plugin that adds a 'cut' operation separate from 'delete'.
    "gbprod/cutlass.nvim",
    opts = {
      cut_key = "x",
    },
  },
}
