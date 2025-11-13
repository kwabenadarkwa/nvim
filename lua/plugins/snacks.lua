-- this is for handling rendering of big files and also rendering images
return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		-- Enable bigfile support
		bigfile = {
			enabled = true,
			notify = true, -- Show notification when big file detected
			size = 1.5 * 1024 * 1024, -- 1.5MB threshold
			-- Customize what gets disabled for big files
			---@param ctx {buf: number, ft:string}
			setup = function(ctx)
				vim.b.minianimate_disable = true
				vim.schedule(function()
					vim.bo[ctx.buf].syntax = ctx.ft
				end)
			end,
		},

		-- Enable image support
		image = {
			enabled = true,
			backend = "kitty", -- For Ghostty
			formats = {
				"png",
				"jpg",
				"jpeg",
				"gif",
				"bmp",
				"webp",
				"tiff",
				"heic",
				"avif",
			},
			doc = {
				enabled = true,
				inline = true,
				max_width = 100,
				max_height = 60,
			},
		},

		-- Everything else stays disabled by default
	},
}
