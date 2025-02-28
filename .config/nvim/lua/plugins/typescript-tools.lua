return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {},
  config = function()
    require('typescript-tools').setup {
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",

        "vue", -- This needed to be added.
      },
      settings = {
        tsserver_plugins = {
          '@vue/typescript-plugin',
        },
        jsx_close_tag = {
          enable = true,
          filetypes = { 'javascriptreact', 'typescriptreact' },
        },
      },
    }
  end,
}
