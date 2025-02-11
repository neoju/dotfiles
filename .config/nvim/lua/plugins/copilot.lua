return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  build = ':Copilot auth',
  enabled = false,
  opts = {
    suggestion = { enabled = false, debounce = 500 },
    panel = { enabled = false },
    filetypes = {
      markdown = true,
      help = true,
    },
  },
}
