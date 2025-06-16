return {
  "ibhagwan/fzf-lua",
  opts = {
    keymap = {
      fzf = {
        ["tab"] = "down",
        ["shift-tab"] = "up",
      },
    },
  },
  config = function()
    require("fzf-lua").register_ui_select()
  end,
}
