local M = {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local colors = require("onedarkpro.helpers").get_colors()
		local conditions = {
			buffer_not_empty = function()
				return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
			end,
			hide_in_width = function()
				return vim.fn.winwidth(0) > 80
			end,
			check_git_workspace = function()
				local filepath = vim.fn.expand("%:p:h")
				local gitdir = vim.fn.finddir(".git", filepath .. ";")
				return gitdir and #gitdir > 0 and #gitdir < #filepath
			end,
		}

		-- Config
		local config = {
			options = {
				-- Disable sections and component separators
				component_separators = "",
				section_separators = "",
				theme = {
					-- We are going to use lualine_c an lualine_x as left and
					-- right section. Both are highlighted by c theme .  So we
					-- are just setting default looks o statusline
					normal = { c = { fg = colors.fg, bg = colors.bg_light } },
					inactive = { c = { fg = colors.fg, bg = colors.bg_light } },
				},
			},
			sections = {
				-- these are to remove the defaults
				lualine_a = {},
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},
				-- These will be filled later
				lualine_c = {},
				lualine_x = {},
			},
			inactive_sections = {
				-- these are to remove the defaults
				lualine_a = {},
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},
				lualine_c = {},
				lualine_x = {},
			},
		}

		-- Inserts a component in lualine_c at left section
		local function ins_left(component)
			table.insert(config.sections.lualine_c, component)
		end

		-- Inserts a component in lualine_x ot right section
		local function ins_right(component)
			table.insert(config.sections.lualine_x, component)
		end

		ins_left({
			"branch",
			icon = "",
			color = { fg = colors.purple, gui = "bold", bg = colors.bg_lighter },
		})

		ins_left({
			"diff",
			-- Is it me or the symbol for modified us really weird
			symbols = { added = " ", modified = " ", removed = " " },
			diff_color = {
				added = { fg = colors.green },
				modified = { fg = colors.orange },
				removed = { fg = colors.red },
			},
			cond = conditions.hide_in_width,
			color = { bg = colors.bg_lighter },
		})

		ins_left({
			-- mode component
			"mode",
			color = function()
				-- auto change color according to neovims mode
				local mode_color = {
					n = colors.green,
					i = colors.red,
					v = colors.blue,
					[""] = colors.blue,
					V = colors.blue,
					c = colors.purple,
					no = colors.red,
					s = colors.orange,
					S = colors.orange,
					[""] = colors.orange,
					ic = colors.yellow,
					R = colors.purple,
					Rv = colors.purple,
					cv = colors.red,
					ce = colors.red,
					r = colors.cyan,
					rm = colors.cyan,
					["r?"] = colors.cyan,
					["!"] = colors.red,
					t = colors.red,
				}
				return { fg = mode_color[vim.fn.mode()], gui = "bold" }
			end,
			padding = { right = 1, left = 1 },
		})

		ins_left({
			-- Lsp server name .
			function()
				local msg = ""
				local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
				local clients = vim.lsp.get_active_clients()
				if next(clients) == nil then
					return msg
				end
				for _, client in ipairs(clients) do
					local filetypes = client.config.filetypes
					if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
						return client.name
					end
				end
				return msg
			end,
			icon = " ",
			color = { fg = colors.blue, gui = "bold" },
		})

		ins_left({
			"diagnostics",
			sources = { "nvim_diagnostic" },
			symbols = { error = " ", warn = " ", info = " " },
			diagnostics_color = {
				color_error = { fg = colors.red },
				color_warn = { fg = colors.yellow },
				color_info = { fg = colors.cyan },
			},
		})

		-- Insert mid section. You can make any number of sections in neovim :)
		-- for lualine it's any number greater then 2
		ins_left({
			function()
				return "%="
			end,
		})

		local status_ok, navic = pcall(require, "nvim-navic")
		if status_ok then
			ins_left({ navic.get_location, cond = navic.is_available })
		end

		ins_right({ "filetype", color = { fg = colors.cyan, gui = "bold" } })

		ins_right({
			"o:encoding", -- option component same as &encoding in viml
			fmt = string.upper, -- I'm not sure why it's upper case either ;)
			cond = conditions.hide_in_width,
			color = { fg = colors.cyan },
		})

		ins_right({
			"fileformat",
			fmt = string.upper,
			icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
			color = { fg = colors.cyan },
		})

		-- Add components to right sections
		ins_right({
			-- filesize component
			"filesize",
			cond = conditions.buffer_not_empty,
		})

		ins_right({
			"filename",
			cond = conditions.buffer_not_empty,
			color = { fg = colors.purple, gui = "bold" },
		})

		ins_right({ "location" })

		ins_right({ "progress", color = { fg = colors.fg, gui = "bold" } })

		local progress = function()
			local current_line = vim.fn.line(".")
			local total_lines = vim.fn.line("$")
			local chars = {
				"__",
				"▁▁",
				"▂▂",
				"▃▃",
				"▄▄",
				"▅▅",
				"▆▆",
				"▇▇",
				"██",
			}
			local line_ratio = current_line / total_lines
			local index = math.ceil(line_ratio * #chars)
			return chars[index]
		end

		ins_right({ progress, color = { fg = colors.blue }, padding = { left = 1 } })

		-- Now don't forget to initialize lualine
		lualine.setup(config)
	end,
}

return M
