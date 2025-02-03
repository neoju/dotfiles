local img_previewer ---@type string[]?
for _, v in ipairs {
  { cmd = 'chafa', args = { '{file}', '--format=symbols' } },
  { cmd = 'viu', args = { '-b' } },
} do
  if vim.fn.executable(v.cmd) == 1 then
    img_previewer = vim.list_extend({ v.cmd }, v.args)
    break
  end
end

return {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local utils = require('fzf-lua').utils
    local height = math.floor(0.618 * vim.o.lines)
    local width = math.floor(0.618 * vim.o.columns)

    require('fzf-lua').setup {
      winopts = {
        height,
        width,
        preview = {
          scrollbar = false,
          layout = 'vertical',
          vertical = 'down:70%',
        },
      },
      fzf_colors = true,
      fzf_opts = {
        ['--bind'] = 'tab:down,shift-tab:up,enter:accept',
      },
      fzf_args = '--bind tab:down,shift-tab:up,enter:accept',
      previewers = {
        bat = { args = '--color=always --style=default' },
        builtin = {
          extensions = {
            ['png'] = img_previewer,
            ['jpg'] = img_previewer,
            ['jpeg'] = img_previewer,
            ['gif'] = img_previewer,
            ['webp'] = img_previewer,
            ['svg'] = img_previewer,
          },
        },
      },
      lsp = {
        lsp = {
          finder = {
            providers = {
              { 'definitions', prefix = utils.ansi_codes.green 'def ' },
              { 'declarations', prefix = utils.ansi_codes.magenta 'decl' },
              { 'implementations', prefix = utils.ansi_codes.green 'impl' },
              { 'typedefs', prefix = utils.ansi_codes.red 'tdef' },
              { 'references', prefix = utils.ansi_codes.blue 'ref ' },
              { 'incoming_calls', prefix = utils.ansi_codes.cyan 'in  ' },
              { 'outgoing_calls', prefix = utils.ansi_codes.yellow 'out ' },
            },
          },
          code_actions = {
            winopts = {
              relative = 'cursor',
              row = 1,
              col = 0,
              height = 0.4,
              preview = { vertical = 'down:70%' },
            },
            previewer = vim.fn.executable 'delta' == 1 and 'codeaction_native' or nil,
            preview_pager = "delta --width=$COLUMNS --hunk-header-style='omit' --file-style='omit'",
          },
        },
      },
    }
  end,
  keys = {
    { '<leader>:', '<cmd>FzfLua command_history<cr>', desc = 'Command History' },
    -- find
    { '<leader><space>', '<cmd>FzfLua files<CR>', desc = 'Find Files (Root Dir)' },
    { '<leader>fb', '<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>', desc = 'Buffers' },
    -- git
    { '<leader>gc', '<cmd>FzfLua git_commits<CR>', desc = 'Commits' },
    { '<leader>gs', '<cmd>FzfLua git_status<CR>', desc = 'Status' },
    -- search
    { '<leader>s"', '<cmd>FzfLua registers<cr>', desc = 'Registers' },
    { '<leader>sa', '<cmd>FzfLua autocmds<cr>', desc = 'Auto Commands' },
    { '<leader>sg', '<cmd>FzfLua live_grep<cr>', desc = 'Live Grep' },
    { '<leader>sb', '<cmd>FzfLua grep_curbuf<cr>', desc = 'Buffer' },
    { '<leader>sc', '<cmd>FzfLua command_history<cr>', desc = 'Command History' },
    { '<leader>sC', '<cmd>FzfLua commands<cr>', desc = 'Commands' },
    { '<leader>sd', '<cmd>FzfLua diagnostics_document<cr>', desc = 'Document Diagnostics' },
    { '<leader>sD', '<cmd>FzfLua diagnostics_workspace<cr>', desc = 'Workspace Diagnostics' },
    { '<leader>sh', '<cmd>FzfLua help_tags<cr>', desc = 'Help Pages' },
    { '<leader>sH', '<cmd>FzfLua highlights<cr>', desc = 'Search Highlight Groups' },
    { '<leader>sj', '<cmd>FzfLua jumps<cr>', desc = 'Jumplist' },
    { '<leader>sk', '<cmd>FzfLua keymaps<cr>', desc = 'Key Maps' },
    { '<leader>sl', '<cmd>FzfLua loclist<cr>', desc = 'Location List' },
    { '<leader>sM', '<cmd>FzfLua man_pages<cr>', desc = 'Man Pages' },
    { '<leader>sm', '<cmd>FzfLua marks<cr>', desc = 'Jump to Mark' },
    { '<leader>sR', '<cmd>FzfLua resume<cr>', desc = 'Resume' },
    { '<leader>sq', '<cmd>FzfLua quickfix<cr>', desc = 'Quickfix List' },
  },
}
