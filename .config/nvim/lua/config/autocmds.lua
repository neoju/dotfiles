-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Disable autoformat for javascript files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "javascript" },
  callback = function()
    -- vim.b.autoformat = false
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.volt" },
  callback = function()
    vim.bo.filetype = "html"
  end,
})
