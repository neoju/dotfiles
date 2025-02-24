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
        tsserver_logs = 'verbose',
        code_lens_mode = 'all',
        tsserver_file_preferences = {
          includeCompletionsForModuleExports = true,
          includeInlayParameterNameHints = 'all',
          includeInlayParameterNameHintsWhenArgumentMatchesName = true,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
          importModuleSpecifierPreference = 'non-relative',
          quotePreference = 'auto',

          -- Keep formatting enabled in tsserver, we’ll filter it dynamically
          provideFormatter = true,
        },
        separate_diagnostic_server = true,
        publish_diagnostic_on = 'insert_leave',
        expose_as_code_action = 'all',
        tsserver_max_memory = 'auto',
        complete_function_calls = true,
        jsx_close_tag = {
          enable = true,
          filetypes = { 'javascriptreact', 'typescriptreact' },
        },
        tsserver_plugins = {
          -- Seemingly this is enough, no name, location or languages needed.
          "@vue/typescript-plugin",
        },
      },
    }
  end,
}
