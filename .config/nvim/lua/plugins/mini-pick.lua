return {
  'echasnovski/mini.pick',
  version = '*',
  config = function()
    local win_config = function()
      local height = math.floor(0.618 * vim.o.lines)
      local width = math.floor(0.618 * vim.o.columns)
      return {
        anchor = 'NW',
        height = height,
        width = width,
        row = math.floor(0.5 * (vim.o.lines - height)),
        col = math.floor(0.5 * (vim.o.columns - width)),
      }
    end

    require('mini.pick').setup {
      -- Delays (in ms; should be at least 1)
      delay = {
        -- Delay between forcing asynchronous behavior
        async = 10,

        -- Delay between computation start and visual feedback about it
        busy = 50,
      },

      -- Keys for performing actions. See `:h MiniPick-actions`.
      mappings = {
        toggle_info = '<C-k>',
        toggle_preview = '<C-p>',
        move_down = '<Tab>',
        move_up = '<S-Tab>',
      },

      -- Centered on screen
      window = { config = win_config },
    }
  end,
  keys = {
    { '<leader>f', group = 'find', desc = 'Find' },
    { '<leader>ff', '<cmd>Pick files<CR>', desc = 'Find File' },
    { '<leader>ft', '<cmd>Pick grep_live<CR>', desc = 'Find Text' },
    { '<leader>fb', '<cmd>Pick buffers<CR>', desc = 'Find Buffers' },
    { '<leader>fr', '<cmd>Pick resume<CR>', desc = 'Resume lastest' },
  },
}
