-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
require 'core.keymaps'
require 'core.options'
require 'core.snippets'

-- Setup lazy.nvim
require('lazy').setup {
  require 'plugins.neotree',
  require 'plugins.treesitter',
  require 'plugins.none-ls',
  require 'plugins.lazygit',
  require 'plugins.catppuccin',
  require 'plugins.blink-cmp',
  require 'plugins.copilot',
  require 'plugins.logsitter',
  require 'plugins.notice',
  require 'plugins.lualine',
  require 'plugins.mini-surround',
  require 'plugins.bufferline',
  require 'plugins.gitsigns',
  require 'plugins.lsp',
  require 'plugins.fzf',
  require 'plugins.typescript-tools',
  require 'plugins.trouble',

  require 'plugins.misc',
}
