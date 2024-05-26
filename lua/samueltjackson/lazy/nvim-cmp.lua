return {
	"hrsh7th/nvim-cmp",
	opts = {
		mapping = {
			["<C-i>"] = function()
				require("luasnip").jump(1)
			end,
			["<C-u>"] = function()
				require("luasnip").jump(-1)
			end,
		},
	},
}
