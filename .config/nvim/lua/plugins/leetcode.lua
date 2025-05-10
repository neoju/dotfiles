return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "ibhagwan/fzf-lua",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  lazy = leet_arg ~= vim.fn.argv(0, -1),
  opts = {
    arg = leet_arg,

    lang = "go",
  },
}
