return {
  "kawre/leetcode.nvim",
  dependencies = {
    -- include a picker of your choice, see picker section for more details
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim",
  },
  opts = {
    -- configuration goes here
    arg = "leetcode",

    lang = "python3",
    image_support = true,
  },
}
