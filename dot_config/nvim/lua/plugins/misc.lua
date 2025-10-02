vim.pack.add({
    -- mini
    { src = "https://github.com/echasnovski/mini.hipatterns", version = "stable" },
    { src = "https://github.com/echasnovski/mini.icons",      version = "stable" },
    { src = "https://github.com/echasnovski/mini.pairs",      version = "stable" },
    { src = "https://github.com/echasnovski/mini.statusline", version = "stable" },
    -- other
    "https://github.com/gbprod/cutlass.nvim",
    "https://github.com/folke/todo-comments.nvim",
    "https://github.com/windwp/nvim-ts-autotag",
    "https://github.com/lukas-reineke/virt-column.nvim",
    "https://github.com/NMAC427/guess-indent.nvim",

    "https://github.com/folke/tokyonight.nvim",
    "https://github.com/ribru17/bamboo.nvim"
}, { confirm = false })

-- set colorscheme
require('bamboo').setup({ style = 'multiplex' })
vim.cmd([[colorscheme bamboo]])

-- mini
require("mini.hipatterns").setup()
require("mini.icons").setup()
require("mini.pairs").setup()
require("mini.statusline").setup()

-- other
require("cutlass").setup({ cut_key = "x" })
require("nvim-ts-autotag").setup()
require("todo-comments").setup()
require("guess-indent").setup()
require("virt-column").setup()
