return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local custom_palenight = require 'lualine.themes.palenight'

    -- Change the background of lualine_c section
    custom_palenight.normal.c.bg = '#171320'
    custom_palenight.inactive.c.bg = '#171320'

    ---@diagnostic disable-next-line: undefined-field
    require('lualine').setup {
      options = {
        theme = custom_palenight,
        disabled_filetypes = { 'neo-tree' },
        always_divide_middle = true,
        icons_enabled = true,
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { 'filename' },

        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'location' },
        lualine_z = { 'progress' },
      },
      extensions = {
        'lazy',
      },
    }
  end,
}
