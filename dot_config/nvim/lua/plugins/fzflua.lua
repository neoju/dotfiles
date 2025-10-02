vim.pack.add({
    -- dependencies
    "https://github.com/folke/snacks.nvim",                         -- for image preview
    "https://github.com/MeanderingProgrammer/render-markdown.nvim", -- for markdown preview
    "https://github.com/nvim-tree/nvim-web-devicons",

    "https://github.com/ibhagwan/fzf-lua",
}, { confirm = false })

local fzf_lua = require("fzf-lua")
local map = vim.keymap.set

fzf_lua.register_ui_select()
fzf_lua.setup({
    keymap = {
        fzf = {
            ["tab"] = "down",
            ["shift-tab"] = "up",
        },
    },
})

map("n", "<leader><Space>", "<CMD>FzfLua files<CR>", { desc = "Find files" })
map("n", "<leader>ff", function()
    FzfLua.files({ cwd = vim.fn.expand('%:p:h') })
end, { desc = "Find files - root" })
map("n", "<leader>fs", "<CMD>FzfLua live_grep<CR>", { desc = "Find string (live_grep)" })
map("n", "<leader>fS", function()
    FzfLua.live_grep({ cwd = vim.fn.expand('%:p:h') })
end, { desc = "Find string (live_grep) - root" })
map("n", "<leader>fr", "<CMD>FzfLua live_grep resume=true<CR>", { desc = "Find string (live_grep) - resume" })
map("n", "<leader>ft", "<CMD>TodoFzfLua<CR>", { desc = "Find todo" })
map("n", "<leader>fd", "<CMD>FzfLua diagnostics_document<CR>", { desc = "Find diagnostics (document)" })
map("n", "<leader>fD", "<CMD>FzfLua diagnostics_workspace<CR>", { desc = "Find diagnostics (workspace)" })
