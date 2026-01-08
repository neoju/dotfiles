return {
  {
    "gbprod/cutlass.nvim",
    opts = { cut_key = "x" },
  },
  {
    "lukas-reineke/virt-column.nvim",
    opts = {},
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        width = 35,
        mappings = {
          ["y"] = "", -- unmap y to avoid conflicts
          ["yi"] = "yank_relative_path",
          ["yy"] = "copy_to_clipboard", -- copy node name
        },
      },
      filesystem = {
        follow_current_file = {
          enabled = true, -- Automatically focus the current file in Neo-tree
        },
        use_libuv_file_watcher = true,
        commands = {
          yank_relative_path = function(state)
            local node = state.tree:get_node()
            if not node or not node.path then
              return
            end

            local relative_path = vim.fn.fnamemodify(node.path, ":.")
            vim.fn.setreg("+", relative_path)

            Snacks.notify.info("Yanked relative path: " .. relative_path)
          end,
        },
      },
      buffers = {
        follow_current_file = {
          enabled = true,
        },
      },
    },
  },
  {
    "chrisgrieser/nvim-origami",
    opts = {
      autoFold = {
        enabled = true,
        kinds = {
          "comment",
          "imports",
          "region",
        },
      },
      foldKeymaps = {
        setup = false,
      },
    },
  },
}
