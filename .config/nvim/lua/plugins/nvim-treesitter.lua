return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    { "nvim-treesitter/nvim-treesitter-textobjects" }, -- Syntax aware text-objects
    {
      "nvim-treesitter/nvim-treesitter-context", -- Show code context
      opts = { enable = true, mode = "topline", line_numbers = true },
    },
  },

  opts = {
    ensure_installed = {
      "bash",
      "nginx",
      "dockerfile",
      "gitignore",

      "lua",
      "php",
      "javascript",
      "typescript",
      "tsx",
      "sql",
      "vue",

      "json",
      "yaml",
      "csv",

      "markdown",
      "html",
      "css",
      "scss",
    },
  },
}
