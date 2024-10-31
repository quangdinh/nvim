local M = {
	"rmagatti/auto-session",
	lazy = false,
	---enables autocomplete for opts
	---@module "auto-session"
	---@type AutoSession.Config
	opts = {
		suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/", "~/Repos" },
		-- log_level = 'debug',
	},
}

return M
