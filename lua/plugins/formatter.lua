return
{

{
	"mhartington/formatter.nvim",
	cmd = { "FormatWrite", "Format" }, -- Utilities for creating configurations
	config = function()
		require("formatter").setup({
			-- Enable or disable logging
			logging = false,
			-- Set the log level
			log_level = vim.log.levels.DEBUG,
			-- All formatter configurations are opt-in
			filetype = {
				cpp = {
					-- clang-format
					function()
						return {
							exe = "clang-format",
							args = {
								"-style='{ BasedOnStyle: Microsoft, InsertNewlineAtEOF: true, IndentWidth: 4, SortIncludes: false, PointerAlignment: Left, ReferenceAlignment: Left }'",
								"--assume-filename",
								"-i",
								vim.api.nvim_buf_get_name(0)
							},
							stdin = true,
							cwd = vim.fn.expand("%:p:h") -- Run clang-format in cwd of the file.
						}
					end
				},
				c = {
					-- clang-format
					function()
						return {
							exe = "clang-format",
							args = {
								"-style='{ BasedOnStyle: Microsoft, InsertNewlineAtEOF: true, IndentWidth: 4, SortIncludes: false, PointerAlignment: Left, ReferenceAlignment: Left }'",
								"--assume-filename",
								"-i",
								vim.api.nvim_buf_get_name(0)
							},
							stdin = true,
							cwd = vim.fn.expand("%:p:h") -- Run clang-format in cwd of the file.
						}
					end
				},
				-- Use the special "*" filetype for defining formatter configurations on any filetype
				["*"] = {
					-- "formatter.filetypes.any" defines default configurations for any filetype
					require("formatter.filetypes.any").remove_trailing_whitespace
					-- Remove trailing whitespace without "sed"
					-- require("formatter.filetypes.any").substitute_trailing_whitespace
				}
			}
		})
	end
},
{
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("lint").linters_by_ft = {
			cpp = { "clangtidy" },
			c = { "clangtidy" }
		}
		local lint_progress = function()
			local linters = require("lint").get_running()
			if #linters == 0 then
				return "󰦕"
			end
			return "󱉶 " .. table.concat(linters, ", ")
		end
	end
}

}