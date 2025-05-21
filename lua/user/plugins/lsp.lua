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
		config = function()
			require("mason").setup({
				registries = {
					"github:mason-org/mason-registry",
					"github:Crashdummyy/mason-registry",
				},
			})
		end,
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

			local masonlsp = require("mason-lspconfig")
			masonlsp.setup({})

			-- nvim-cmp supports additional completion capabilities
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			local opts = { capabilities = capabilities }

			local util = require("lspconfig.util")
			lspconfig.sourcekit.setup({
				capabilities = capabilities,
				root_dir = function(filename, _)
					return util.root_pattern("buildserver.json")(filename)
						or util.root_pattern("*.xcodeproj", "*.xcworkspace")(filename)
						or util.find_git_ancestor(filename)
						or util.root_pattern("Package.siwft")(filename)
				end,
			})
		end,
	},
}

return M
