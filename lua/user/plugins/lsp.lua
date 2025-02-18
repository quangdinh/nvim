_G.lsp_root_dir = vim.fn.stdpath("data") .. "/mason/bin"

local M = {
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		opts = {
			ui = {
				icons = {
					server_installed = "✓",
					server_pending = "o",
					server_uninstalled = "",
				},
			},
		},
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
				Warn = "",
				Hint = "",
				Info = "",
			}

			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
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
				vim.keymap.set("n", "<leader>k", vim.lsp.buf.signature_help, opts)
				vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
				vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
				vim.keymap.set("n", "<leader>wl", function()
					vim.inspect(vim.lsp.buf.list_workspace_folders())
				end, opts)
				vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				-- vim.keymap.set("n", "<leader>ca", require("tiny-code-action").code_action(), opts)
				vim.keymap.set("n", "<leader>so", require("telescope.builtin").lsp_document_symbols, opts)
			end
			local masonlsp = require("mason-lspconfig")
			masonlsp.setup({})

			-- nvim-cmp supports additional completion capabilities
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			local opts = { on_attach = on_attach, capabilities = capabilities }

			local util = require("lspconfig.util")
			lspconfig.sourcekit.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				root_dir = function(filename, _)
					return util.root_pattern("buildserver.json")(filename)
						or util.root_pattern("*.xcodeproj", "*.xcworkspace")(filename)
						or util.find_git_ancestor(filename)
						or util.root_pattern("Package.siwft")(filename)
				end,
			})
			masonlsp.setup_handlers({
				function(server)
					lspconfig[server].setup(opts)
				end,
				["lua_ls"] = function()
					lspconfig.lua_ls.setup({
						settings = { Lua = { diagnostics = { globals = { "vim" } } } },
					})
				end,
			})
		end,
	},
}

return M
