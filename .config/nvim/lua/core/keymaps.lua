-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- For conciseness
local map = vim.keymap.set

-- Disable the spacebar key's default behavior in Normal and Visual modes
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Move to window using the <ctrl> hjkl keys
map('n', '<C-h>', '<C-w>h', { desc = 'Go to Left Window', remap = true })
map('n', '<C-j>', '<C-w>j', { desc = 'Go to Lower Window', remap = true })
map('n', '<C-k>', '<C-w>k', { desc = 'Go to Upper Window', remap = true })
map('n', '<C-l>', '<C-w>l', { desc = 'Go to Right Window', remap = true })

-- Move Lines

-- NOTE: The following keymaps work fine with most terminal emulators except ghostty.
-- local Aj = '<A-j>'
-- local Ak = '<A-k>'
-- For the ghostty terminal:
local Aj = '∆'
local Ak = '˚'

map('n', Aj, "<cmd>execute 'move .+' . v:count1<cr>==", { desc = 'Move Down' })
map('n', Ak, "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = 'Move Up' })
map('i', Aj, '<esc><cmd>m .+1<cr>==gi', { desc = 'Move Down' })
map('i', Ak, '<esc><cmd>m .-2<cr>==gi', { desc = 'Move Up' })
map('v', Aj, ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = 'Move Down' })
map('v', Ak, ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = 'Move Up' })

-- save file
map('n', '<C-s>', '<cmd>w<CR>', { desc = 'Save File' })

-- quit
map('n', '<leader>qq', '<cmd>qa<cr>', { desc = 'Quit All' })

-- Clear search on escape
map({ 'i', 'n', 's' }, '<esc>', function()
  vim.cmd 'noh'
  return '<esc>'
end, { expr = true, desc = 'Escape and Clear hlsearch' })

-- better indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- highlights under cursor
map('n', '<leader>ui', vim.show_pos, { desc = 'Inspect Pos' })
map('n', '<leader>uI', '<cmd>InspectTree<cr>', { desc = 'Inspect Tree' })

-- search and replace in current file
map('n', '<leader>sr', ':lua require(\'grug-far\').open({ prefills = { paths = vim.fn.expand("%") } })<CR>',
  { desc = 'Search and Replace' })
map(
  'v',
  '<leader>sr',
  ':<C-u>lua require(\'grug-far\').with_visual_selection({ prefills = { paths = vim.fn.expand("%") } })<CR>',
  { desc = 'Search and Replace' }
)

-- search and replace in current directory
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('grug-far-keybindings', { clear = true }),
  pattern = { 'grug-far' },
  callback = function()
    -- open result localtion and close grug-far
    vim.api.nvim_buf_set_keymap(0, 'n', '<C-enter>', '<localleader>o<localleader>c', {})

    -- jump back to search input by hitting left arrow in normal mode:
    map('n', '<left>', function()
      vim.api.nvim_win_set_cursor(vim.fn.bufwinid(0), { 2, 0 })
    end, { buffer = true })
  end,
})

-- close window
map('n', '<leader>wd', '<cmd>close<cr>', { desc = 'Close Window' })

-- Set a custom keymap to update the window title
map('n', '<leader>wt', function()
  -- Set a buffer-local flag to disable blink.cmp completionsv
  vim.b.blink_cmp_disabled = true

  -- Prompt for title without blink.cmp interfering
  local title = vim.fn.input('Enter window title: ')

  -- Re-enable blink.cmp by clearing the flag
  vim.b.blink_cmp_disabled = nil

  -- Set the title, replacing spaces with hyphens
  if title and title ~= "" then
    vim.cmd('set titlestring=' .. title:gsub('%s+', '-'))
    vim.cmd('set title')
  end
end, { desc = 'Set Window Title' })
