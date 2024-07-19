local M = {
	"nvim-neotest/neotest",
	dependencies = { "nvim-neotest/neotest-go", "haydenmeade/neotest-jest" },
	cmd = "Neotest",
	config = function()
		local neotest_ns = vim.api.nvim_create_namespace("neotest")
		vim.diagnostic.config({
			virtual_text = {
				format = function(diagnostic)
					local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
					return message
				end,
			},
		}, neotest_ns)
		require("neotest").setup({
			-- your neotest config here
			adapters = {
				require("neotest-go")({
					experimental = { test_table = true },
					args = { "-timeout=60s" },
				}),
				require("neotest-jest")({
					jestCommand = "yarn test --",
					cwd = function(path)
						return vim.fn.getcwd()
					end,
				}),
			},
		})
	end,
}
return M
