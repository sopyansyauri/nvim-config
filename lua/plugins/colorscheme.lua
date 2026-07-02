return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		prioriy = 1000,
		config = function()
			vim.cmd.colorscheme("tokyonight")
		end,
	}
}
