-- nvim/lua/pluginlist.lua

return {
	-- LSP
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",

	"folke/neodev.nvim",
	-- CMP
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
			'rafamadriz/friendly-snippets',

			'hrsh7th/cmp-nvim-lsp',
		},
	},
	-- colorscheme
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			vim.cmd("colorscheme gruvbox")
			vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
			vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
		end
	},
	-- comment
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end
	},
	-- better status line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons"
		},
		config = function()
			require("lualine").setup({
				icons_enabled = true,
				theme = 'gruvbox',
			})
		end,
	},
	-- telescope
	{
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
	-- TreeSitter
	{

		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
	},
    -- Harpoon
	"theprimeagen/harpoon",

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {}
    },
}
