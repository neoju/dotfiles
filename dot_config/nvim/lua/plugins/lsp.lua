vim.pack.add({
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/mason-org/mason-lspconfig.nvim",
    "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
    "https://github.com/rachartier/tiny-inline-diagnostic.nvim",
    "https://github.com/rachartier/tiny-code-action.nvim",

    { src = "https://github.com/neovim/nvim-lspconfig" },
}, { confirm = false })

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "gopls",
        "pyright",

        -- web development
        "svelte",
        "vue_ls",
        "vtsls",
        "html",
        "tailwindcss",
        "cssls",
    },
})

require("mason-tool-installer").setup({
    ensure_installed = {
        {
            "eslint_d",
            --version = "13.1.2"
        },
        "prettierd",
    },
})

-- Code Action
require("tiny-code-action").setup({ picker = "snacks" })

-- Diagnostics
require("tiny-inline-diagnostic").setup({ preset = "powerline" })
vim.diagnostic.config({ virtual_text = false })

-- LSP Config
vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = {
                    "vim",
                    "require",
                },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            codeLens = {
                enable = true,
            },
            completion = {
                callSnippet = "Replace",
            },
            doc = {
                privateName = { "^_" },
            },
            hint = {
                enable = true,
                setType = false,
                paramType = true,
                paramName = "Disable",
                semicolon = "Disable",
                arrayIndex = "Disable",
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

local mason_packages = vim.fn.stdpath("data") .. "/mason/packages"
local vuels_path = mason_packages .. "/vue-language-server/node_modules/@vue/language-server"

vim.lsp.config("vtsls", {
    filetypes = { "vue", "typescript", "javascript", "javascriptreact", "typescriptreact" },
    settings = {
        vtsls = {
            tsserver = {
                globalPlugins = {
                    {
                        name = "@vue/typescript-plugin",
                        location = vuels_path,
                        languages = { "vue" },

                        configNamespace = "typescript",
                    },
                },
            },
        },
        typescript = {
            suggest = { completeFunctionCalls = true },
            inlayHints = {
                enumMemberValues = {
                    enabled = true,
                },
                functionLikeReturnTypes = {
                    enabled = true,
                },
                parameterNames = { enabled = "all" },
                parameterTypes = {
                    enabled = true,
                    suppressWhenArgumentMatchesName = true,
                },
                propertyDeclarationTypes = {
                    enabled = true,
                },
                variableTypes = {
                    enabled = true,
                },
            },
        },
    },
})

vim.lsp.config("vue_ls", {
    filetypes = { "vue" },

    init_options = {
        vue = {
            hybridMode = false,
        },
        typescript = {
            tsdk = vim.fn.finddir("node_modules/typescript/lib", vim.fn.getcwd() .. ";")
                or "/path/to/global/typescript/lib", -- Path to TypeScript SDK
        },
    },
    settings = {
        typescript = {
            inlayHints = {
                enumMemberValues = {
                    enabled = true,
                },
                functionLikeReturnTypes = {
                    enabled = true,
                },
                propertyDeclarationTypes = {
                    enabled = true,
                },
                parameterTypes = {
                    enabled = true,
                    suppressWhenArgumentMatchesName = true,
                },
                variableTypes = {
                    enabled = true,
                },
            },
        },
    },
})

vim.lsp.config("pyright", {})
