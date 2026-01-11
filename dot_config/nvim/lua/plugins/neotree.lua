return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      width = 35,
      mappings = {
        ["y"] = "", -- unmap y to avoid conflicts
        ["yi"] = "yank_relative_path",
        ["yy"] = "copy_to_clipboard", -- copy node name

        -- unmap default sort mappings to avoid conflicts
        ["oc"] = "",
        ["od"] = "",
        ["og"] = "",
        ["om"] = "",
        ["on"] = "",
        ["os"] = "",
        ["ot"] = "",

        ["o"] = "open",

        ["Oc"] = { "order_by_created", nowait = false },
        ["Od"] = { "order_by_diagnostics", nowait = false },
        ["Og"] = { "order_by_git_status", nowait = false },
        ["Om"] = { "order_by_modified", nowait = false },
        ["On"] = { "order_by_name", nowait = false },
        ["Os"] = { "order_by_size", nowait = false },
        ["Ot"] = { "order_by_type", nowait = false },
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
}
