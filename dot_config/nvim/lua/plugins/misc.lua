return {
  {
    "gbprod/cutlass.nvim",
    opts = { cut_key = "x" },
  },
  {
    "lukas-reineke/virt-column.nvim",
    opts = {},
  },
  {
    "chrisgrieser/nvim-origami",
    opts = {
      autoFold = {
        enabled = true,
        kinds = {
          "comment",
          "imports",
          "region",
        },
      },
      foldKeymaps = {
        setup = false,
      },
    },
  },
}
