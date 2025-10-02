vim.pack.add({
    "https://github.com/kawre/leetcode.nvim",

    "https://github.com/3rd/image.nvim"
}, { confirm = false })

require("image").setup()

require("leetcode").setup({
    ---@type string
    arg = "lc",

    ---@type lc.lang
    lang = "python3",

    ---@type boolean
    logging = true,

    editor = {
        reset_previous_code = false, ---@type boolean
        fold_imports = true, ---@type boolean
    },

    ---@type lc.picker
    picker = { provider = "snacks-picker" },

    ---@type boolean
    image_support = true,
})
