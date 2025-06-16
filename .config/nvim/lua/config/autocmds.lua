-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Read volt files as php
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.volt" },
  callback = function()
    vim.bo.filetype = "html"
  end,
})

-- check when starting new nvim session, the window title could be passed as parameter
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local args = vim.fn.argv()
    if #args > 1 then
      local title = args[2]

      if title and title ~= "" then
        vim.cmd("set titlestring=" .. title:gsub("%s+", "-"))
        vim.cmd("set title")
      end
    end
  end,
})

-- function to log the filetype on entered
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local filetype = vim.bo.filetype
    print("Filetype: " .. filetype)
  end,
})
