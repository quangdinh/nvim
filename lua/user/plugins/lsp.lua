_G.lsp_root_dir = vim.fn.stdpath("data") .. "/mason/bin"

local servers = {
  "ansiblels", "bashls", "clangd", "cssls", "dockerls", "flux_lsp",
  "gopls", "gradle_ls", "graphql", "html", "jsonls", "java_language_server",
  "ltex", "lua_ls", "marksman", "pyright", "ruby_ls", "rust_analyzer",
  "sqlls", "tsserver", "yamlls"
}

local M = {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {
      ui = {
        icons = {
          server_installed = "✓",
          server_pending = "o",
          server_uninstalled = ""
        }
      }
    }
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      vim.diagnostic.config({
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

      local lspconfig = require("lspconfig")

      local signs = {
          Error = "",
          Warn  = "",
          Hint  = "",
          Info  = "",
      }

      for type, icon in pairs(signs) do
          local hl = "DiagnosticSign" .. type
          vim.fn.sign_define(hl, {
              text = icon,
              texthl = hl,
              numhl = hl
          })
      end

      local on_attach = function(_, bufnr)
          local opts = { buffer = bufnr }
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "<leader>ln", vim.diagnostic.goto_next, opts)
          vim.keymap.set("n", "<leader>lp", vim.diagnostic.goto_prev, opts)
          vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, opts)
          vim.keymap.set("n", "<leader>k", vim.lsp.buf.signature_help, opts)
          vim.keymap.set("n", "<leader>wa",
              vim.lsp.buf.add_workspace_folder, opts)
          vim.keymap.set("n", "<leader>wr",
              vim.lsp.buf.remove_workspace_folder, opts)
          vim.keymap.set("n", "<leader>wl", function()
              vim.inspect(vim.lsp.buf.list_workspace_folders())
          end, opts)
          vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "<leader>so",
              require("telescope.builtin").lsp_document_symbols, opts)
      end
      local masonlsp = require("mason-lspconfig")
      masonlsp.setup({})

      -- nvim-cmp supports additional completion capabilities
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      masonlsp.setup_handlers({
        function(server)
          local opts = {
            on_attach = on_attach,
            capabilities = capabilities,
          }
          lspconfig[server].setup(opts)
        end
      })    
  end
  },
  {
    "ray-x/lsp_signature.nvim",
    config = function()
      local cfg = {
        hint_enable = false, -- virtual hint enable
        hint_prefix = " ",  -- Panda for parameter, NOTE: for the terminal not support emoji, might crash
      }
      require'lsp_signature'.setup(cfg) -- no need to specify bufnr if you don't use toggle_key
    end
  }
}


return M