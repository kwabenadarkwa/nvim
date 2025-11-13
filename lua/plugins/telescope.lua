return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
		},
		tag = "0.1.8",

		config = function()
			local actions = require("telescope.actions")
			local builtin = require("telescope.builtin")

			require("telescope").setup({
				defaults = {
					mappings = {
						n = {
							["q"] = actions.close,
						},
					},
					preview = {
						filetype_hook = function(filepath, bufnr, opts)
							local is_image = function(path)
								local image_extensions = { "png", "jpg", "jpeg", "gif", "webp", "bmp" }
								local split_path = vim.split(path:lower(), ".", { plain = true })
								local extension = split_path[#split_path]
								return vim.tbl_contains(image_extensions, extension)
							end
							if is_image(filepath) then
								require("snacks").image.buf.attach(bufnr, { src = filepath })
								return false
							end
							return true
						end,
					},
				},
				pickers = {
					find_files = {
						-- theme = "ivy",
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							-- even more opts
						}),
					},
				},
			})

			-- Load extensions
			require("telescope").load_extension("ui-select")

			-- Set up keymaps
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>wg", builtin.current_buffer_fuzzy_find, {})
		end,
	},
}
