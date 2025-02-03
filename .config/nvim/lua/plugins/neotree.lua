return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  config = function()
    local events = require 'neo-tree.events'

    local function open_grug_far(prefills)
      local grug_far = require 'grug-far'

      if not grug_far.has_instance 'explorer' then
        grug_far.open {
          instanceName = 'explorer',
          staticTitle = 'Find and Replace from Explorer',
          prefills = prefills,
        }
      else
        grug_far.open_instance 'explorer'
      end
      -- doing it seperately because multiple paths doesn't open work when passed with open
      -- updating the prefills without clearing the search and other fields
      grug_far.update_instance_prefills('explorer', prefills, false)
    end

    require('neo-tree').setup {
      close_if_last_window = false,
      popup_border_style = 'rounded',
      enable_git_status = true,
      open_files_do_not_replace_types = { 'terminal', 'trouble' },
      use_libuv_file_watcher = true,

      commands = {
        -- create a new neo-tree command
        grug_far_replace = function(state)
          local node = state.tree:get_node()
          local prefills = {
            -- also escape the paths if space is there
            -- if you want files to be selected, use ':p' only, see filename-modifiers
            paths = node.type == 'directory' and vim.fn.fnameescape(vim.fn.fnamemodify(node:get_id(), ':p'))
              or vim.fn.fnameescape(vim.fn.fnamemodify(node:get_id(), ':h')),
          }
          print('🚀 -> neotree.lua:41 -> paths: ' .. vim.inspect(prefills.paths))
          open_grug_far(prefills)
        end,
        -- https://github.com/nvim-neo-tree/neo-tree.nvim/blob/fbb631e818f48591d0c3a590817003d36d0de691/doc/neo-tree.txt#L535
        grug_far_replace_visual = function(state, selected_nodes, callback)
          local paths = {}
          for _, node in pairs(selected_nodes) do
            -- also escape the paths if space is there
            -- if you want files to be selected, use ':p' only, see filename-modifiers
            local path = node.type == 'directory' and vim.fn.fnameescape(vim.fn.fnamemodify(node:get_id(), ':p'))
              or vim.fn.fnameescape(vim.fn.fnamemodify(node:get_id(), ':h'))
            table.insert(paths, path)
          end
          local prefills = { paths = table.concat(paths, '\n') }
          open_grug_far(prefills)
        end,
      },

      window = {
        width = 30,
        mappings = {
          ['<space>'] = 'none',
          z = 'grug_far_replace',
        },
      },

      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            '.DS_Store',
            'thumbs.db',
            'node_modules',
            '__pycache__',
            '.virtual_documents',
            '.git',
            '.python-version',
            '.venv',
          },
        },
      },

      event_handlers = {
        {
          event = events.NEO_TREE_WINDOW_AFTER_OPEN,
          handler = function()
            -- disable number - relative number when open neotree
            vim.cmd 'setlocal nornu nonu'
          end,
        },
      },
    }

    vim.keymap.set('n', '<leader>e', '<cmd>Neotree<CR>', { noremap = true, silent = true, desc = 'File Explorer' })

    -- Open Neotree automatically
    vim.api.nvim_create_autocmd('VimEnter', { command = 'Neotree' })
  end,
}
