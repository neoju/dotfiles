-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

-- Set a custom keymap to update the window title
vim.keymap.set("n", "<leader>wt", function()
  local title = vim.fn.input("Enter window title: ")
  vim.cmd("set titlestring=" .. title)
  vim.cmd("set title")
end, { desc = "Set Window Title" })
