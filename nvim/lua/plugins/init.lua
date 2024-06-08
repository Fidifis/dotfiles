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
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = require("utils.mason-conform"),
		},
	},

	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			-- automatic_installation = true,
			ensure_installed = require("configs.lspservers"),
		},
		dependencies = {
			"williamboman/mason.nvim",
		},
		config = function(_, opts)
			require("mason-lspconfig").setup(opts)
		end,
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("utils.lspconfig")
		end,
	},
}
