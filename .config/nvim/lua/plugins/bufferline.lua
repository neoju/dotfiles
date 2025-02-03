return {
  'akinsho/bufferline.nvim',
  dependencies = {
    'moll/vim-bbye',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('bufferline').setup {
      options = {
        themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
        numbers = 'none', -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
        close_command = 'Bdelete! %d', -- can be a string | function, see "Mouse actions"
      },
    }

    vim.keymap.set('n', '<leader>b', '', { desc = 'Buffer' })
    vim.keymap.set('n', '<leader>bb', '<cmd>e #<cr>', { noremap = true, silent = true, desc = 'Switch to Other Buffer' })
    vim.keymap.set('n', '<leader>bd', '<cmd>Bdelete!<CR>', { noremap = true, silent = true, desc = 'Close current' })
    vim.keymap.set('n', '<leader>bo', '<cmd>BufferLineCloseOther<CR>', { noremap = true, silent = true, desc = 'Close others' })
    vim.keymap.set('n', '<leader>bp', '<cmd>BufferLineTogglePin<CR>', { noremap = true, silent = true, desc = 'Toggle pin buffer' })
    vim.keymap.set('n', '<S-h>', '<cmd>BufferLineCycleNext<CR>', { noremap = true, silent = true, desc = 'Cycle next' })
    vim.keymap.set('n', '<S-l>', '<cmd>BufferLineCyclePrev<CR>', { noremap = true, silent = true, desc = 'Cycle prev' })
  end,
}
