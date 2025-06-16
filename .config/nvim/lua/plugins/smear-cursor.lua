return {
  "sphamba/smear-cursor.nvim",
  enabled = false,
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
    time_interval = 5,

    filetypes_disabled = { "snacks_terminal" },
  },
}
