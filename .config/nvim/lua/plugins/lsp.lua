---@diagnostic disable: missing-parameter, param-type-mismatch
local methods = vim.lsp.protocol.Methods

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    { 'j-hui/fidget.nvim',       opts = {} },
    'saghen/blink.cmp',
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        map('gd', vim.lsp.buf.definition, 'Goto Definition')
        map('gr', vim.lsp.buf.references, 'Goto References')
        map('gI', vim.lsp.buf.implementation, 'Goto Implementation')
        map('gD', vim.lsp.buf.declaration, 'Goto Declaration')
        map('<leader>cr', vim.lsp.buf.rename, 'Rename')

        local client = vim.lsp.get_client_by_id(event.data.client_id)

        if not client then
          return nil
        end

        if client.supports_method(methods.textDocument_hover) then
          map('K', vim.lsp.buf.hover, 'Show Kind')
        end

        if client.supports_method(methods.textDocument_codeAction) then
          map('<leader>ca', function()
            require('fzf-lua').lsp_code_actions {
              winopts = {
                relative = 'cursor',
                height = 0.45,
                width = 0.55,
                preview = { vertical = 'down:75%' },
              },
            }
          end, 'Code actions', { 'n', 'v' })
        end

        if client.supports_method(methods.textDocument_documentHighlight) then
          local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
            end,
          })
        end

        if client.supports_method(methods.textDocument_inlayHint) then
          map('<leader>th', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
          end, '[T]oggle Inlay [H]ints')
        end
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('blink.cmp').get_lsp_capabilities())

    local servers = {
      html = { filetypes = { 'html', 'twig', 'hbs' } },

      tailwindcss = {
        filetypes = { 'vue', 'typescriptreact', 'javascriptreact' }
      },

      eslint = {
        settings = {
          -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
          workingDirectories = { mode = 'auto' },
          format = true,
        },
      },

      lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = 'Replace',
            },
            runtime = { version = 'LuaJIT' },
            workspace = {
              checkThirdParty = false,
              library = {
                '${3rd}/luv/library',
                unpack(vim.api.nvim_get_runtime_file('', true)),
              },
            },
            diagnostics = { disable = { 'missing-fields' } },
            format = {
              enable = true,
            },
          },
        },
      },
    }

    require('mason').setup()

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      'stylua', -- Used to format Lua code
    })
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    require('mason-lspconfig').setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }

    vim.lsp.handlers["client/registerCapability"] = function(err, result, ctx)
      -- Check if it’s eslint and the specific workspace folder capability
      if ctx.client_id and vim.lsp.get_client_by_id(ctx.client_id).name == "eslint" and
          result and result.method == "workspace/didChangeWorkspaceFolders" then
        return nil -- Silently ignore
      end
      -- Let NeoVim handle it naturally without forcing a callback
      return vim.lsp.protocol.make_client_capabilities()
    end
  end,
}
