vim.g.mapleader = " "

local map = vim.keymap.set

map("n", "<C-s>", "<CMD>write<CR>", { desc = "Save" })
map("n", "<leader>qq", "<CMD>quitall<CR>", { desc = "Quit all" })

-- Clear search highlight
map("n", "<ESC>", "<CMD>nohlsearch<CR>", { desc = "Clear search highlight" })

-- Move Lines
-- NOTE: The following keymaps work fine with most terminal emulators except ghostty.
local Aj = "<A-j>"
local Ak = "<A-k>"
-- For the ghostty terminal:
-- Aj = "∆"
-- Ak = "˚"
map("n", Aj, "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", Ak, "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", Aj, "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", Ak, "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", Aj, ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", Ak, ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- Jump between windows using Ctrl + hjkl
map("n", "<C-l>", "<CMD>wincmd l<CR>")
map("n", "<C-h>", "<CMD>wincmd h<CR>")
map("n", "<C-j>", "<CMD>wincmd j<CR>")
map("n", "<C-k>", "<CMD>wincmd k<CR>")

-- Jump to last edit position
map("n", "<C-o>", "g;")
map("n", "<C-i>", "g,")

-- Set a custom keymap to update the window title
map("n", "<leader>wt", function()
    -- Prompt for title without blink.cmp interfering
    vim.ui.input({ prompt = "Enter window title: " }, function(title)
        -- Set the title, replacing spaces with hyphens
        if title and title ~= "" then
            vim.cmd("set titlestring=" .. title:gsub("%s+", "-"))
            vim.cmd("set title")
        end
    end)
end, { desc = "Set Window Title" })

-- LSP keymaps
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP rename" })
map({ "n", "x" }, "<leader>ca", function()
    require("tiny-code-action").code_action()
end, { desc = "LSP Code Action" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to Declaration" })
map("n", "gr", vim.lsp.buf.references, { desc = "Go to References" })
map("n", "gy", vim.lsp.buf.type_definition, { desc = "Go to T[y]pe Definition" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover" })

map("n", "<leader>qf", vim.diagnostic.setloclist, { desc = "Open quickfix with diagnostics" })

-- Function to open URL under cursor
local function open_url_under_cursor()
    -- Get the word under cursor
    local uri = vim.fn.expand('<cWORD>')

    -- Escape question marks in the URL
    uri = uri:gsub('?', '\\?')

    -- Shell escape the URL
    -- Note: Lua doesn't have a direct equivalent to Vim's shellescape, so we'll use basic quoting
    uri = string.format("'%s'", uri)

    -- Check if URL is not empty
    if uri ~= "''" then
        -- Determine shell and appropriate open command
        local open_cmd = 'xdg-open' -- macOS uses 'open', Linux can use 'xdg-open' or 'gio open'

        -- Execute the command silently
        vim.fn.execute('!' .. open_cmd .. ' ' .. uri)

        -- Redraw the screen
        vim.cmd('redraw!')
    end
end

map("n", "gx", open_url_under_cursor, { desc = "Open URL under cursor" })
