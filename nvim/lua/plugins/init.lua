return {
	{
		"stevearc/conform.nvim",
		opts = require("configs.conform"),
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = require("configs.nvimtree"),
	},

	{
		"nvim-treesitter/nvim-treesitter",
		cmd = { "TSUpdate" },
		opts = require("configs.treesitter"),
	},

	{ "tpope/vim-unimpaired", lazy = false },

	{ "tpope/vim-surround", lazy = false },

	{
		"Pocco81/auto-save.nvim",
		event = { "TextChanged" },
	},

	{
		"jiaoshijie/undotree",
		dependencies = "nvim-lua/plenary.nvim",
		config = true,
		keys = {
			{
				"<leader>u",
				function()
					require("undotree").toggle()
				end,
				desc = "Undo tree",
			},
		},
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("utils.lspconfig")
		end,
	},
}
