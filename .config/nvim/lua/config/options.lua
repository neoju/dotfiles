-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- disable mouse
opt.mouse = "a"

opt.number = true
opt.relativenumber = true -- Relative line numbers
opt.title = true
opt.titlestring = "%{expand('%:p:h:h:t')} - %{expand('%:p:h:t')}"
