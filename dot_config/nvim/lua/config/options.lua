local opt = vim.opt

vim.g.maplocalleader = "\\"

opt.number = true
opt.relativenumber = true
opt.wrap = false
opt.swapfile = false
opt.clipboard = "unnamedplus"
opt.colorcolumn = "80"

-- Indentation settings
opt.tabstop = 4        -- Number of spaces that a <Tab> counts for
opt.softtabstop = 4    -- Number of spaces for <Tab> in insert mode
opt.shiftwidth = 4     -- Number of spaces to use for each step of (auto)indent
opt.expandtab = true   -- Use spaces instead of tabs
opt.smartindent = true -- Enable smart indentation

-- recommended for nvim-origami: disable vim's auto-folding
opt.foldlevel = 99
opt.foldlevelstart = 99
