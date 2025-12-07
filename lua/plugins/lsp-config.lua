return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    dependencies = {
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp", -- Assegura que tens isto instalado para o capabilities
    },
    opts = {
      auto_install = true,
    },
    config = function(_, opts)
      local mlsp = require("mason-lspconfig")
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Configuração centralizada via Handlers
      mlsp.setup({
        ensure_installed = opts.ensure_installed,
        handlers = {
          -- 1. Handler Padrão: Aplica-se a TODOS os servidores instalados pelo Mason
          function(server_name)
            lspconfig[server_name].setup({
              capabilities = capabilities,
            })
          end,

          -- 2. Exceção para Java (se usares nvim-jdtls, não queremos configurar aqui)
          ["jdtls"] = function()
            -- Deixa vazio para não configurar o jdtls via lspconfig
          end,

          -- 3. Exemplo: Se precisares de configurações específicas para Lua, define aqui:
          ["lua_ls"] = function()
            lspconfig.lua_ls.setup({
              capabilities = capabilities,
              settings = {
                Lua = {
                  diagnostics = { globals = { "vim" } },
                },
              },
            })
          end,
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      -- Na versão 0.11, evitamos chamar 'require("lspconfig").setup' aqui se já usamos o Mason
      -- Definimos apenas os keymaps globais quando um LSP anexa ao buffer
      
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        end,
      })
    end,
  },
}
