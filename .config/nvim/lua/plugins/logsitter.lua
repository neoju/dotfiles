return {
  'gaelph/logsitter.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('logsitter').setup {
      path_format = 'fileonly',
      prefix = '🚀 ->',
      separator = '->',
    }
  end,
  keys = {
    { '<leader>lg', "<cmd>lua require('logsitter').log()<CR>" },
    { '<leader>lg', mode = { 'x' }, "<cmd>lua require('logsitter').log_visual()<CR>" },
  },
}
