return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      signs_staged = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    }

    vim.keymap.set('n', '<leader>gb', '<cmd>Gitsigns blame_line<CR>', { desc = 'Blame line' })
    vim.keymap.set('n', '<leader>ghs', '<cmd>Gitsigns stage_hunk<CR>', { desc = 'Stage hunk' })
    vim.keymap.set('n', '<leader>ghr', '<cmd>Gitsigns reset_hunk<CR>', { desc = 'Reset hunk' })
  end,
}
