-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- For conciseness
local map = vim.keymap.set

-- Move Lines

-- NOTE: The following keymaps work fine with most terminal emulators except ghostty.
-- local Aj = '<A-j>'
-- local Ak = '<A-k>'
-- For the ghostty terminal:
local Aj = "∆"
local Ak = "˚"

map("n", Aj, "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", Ak, "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", Aj, "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", Ak, "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", Aj, ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", Ak, ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- Set a custom keymap to update the window title
map("n", "<leader>wt", function()
  -- Prompt for title without blink.cmp interfering
  local title = vim.fn.input("Enter window title: ")

  -- Set the title, replacing spaces with hyphens
  if title and title ~= "" then
    vim.cmd("set titlestring=" .. title:gsub("%s+", "-"))
    vim.cmd("set title")
  end
end, { desc = "Set Window Title" })

-- Key map to open codeium chat
-- Prefix 'a' for AI
map("n", "<leader>ac", "<cmd>Codeium Chat<CR>", { desc = "Open Codeium Chat" })
