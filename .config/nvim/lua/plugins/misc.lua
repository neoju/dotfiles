return {
  {
    "brenoprata10/nvim-highlight-colors",
    opts = {
      render = "virtual",
      virtual_symbol = "",
    },
  },
  {
    "sphamba/smear-cursor.nvim",
    opts = {
      cursor_color = "#ff8800",
      stiffness = 0.3,
      trailing_stiffness = 0.1,
      trailing_exponent = 5,
      never_draw_over_target = true,
      hide_target_hack = true,
      gamma = 1,
      legacy_computing_symbols_support = true,
      smear_terminal_mode = true,
      time_interval = 10,
    },
  },

  -- Decorate scrollbar.
  {
    "lewis6991/satellite.nvim",
    opts = {},
  },
  -- Smooth scrolling for any movement command.
  {
    "declancm/cinnamon.nvim",
    version = "*", -- use latest release
    opts = {},
  },
  -- Automatically exit Insert mode after inactivity.
  {
    "csessh/stopinsert.nvim",
    opts = {},
  },
  -- Plugin that adds a 'cut' operation separate from 'delete'.
  {
    "gbprod/cutlass.nvim",
    opts = {
      cut_key = "x",
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, "overseer")
    end,
  },
}
