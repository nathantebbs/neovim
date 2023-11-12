-- nvim/lua/pluginlist.lua

return {
	-- LSP
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",

	"folke/neodev.nvim",
	-- CMP
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",

			"hrsh7th/cmp-nvim-lsp",
		},
	},
	-- colorscheme
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			vim.cmd("colorscheme gruvbox")
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		end,
	},
	-- comment
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	-- better status line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("lualine").setup({
				icons_enabled = true,
				theme = "gruvbox",
			})
		end,
	},
	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	-- TreeSitter
	{

		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	-- Harpoon
	"theprimeagen/harpoon",

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},

	-- Fomratting
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				sh = { "beautysh" },
				bash = { "beautysh" },
				c = { "clang_format" },
				cpp = { "clang_format" },
				java = { "clang_format" },
				lua = { "stylua" },
				go = { "gofumpt" },
				html = { "prettierd" },
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				markdown = { "prettierd" },
				json = { "prettierd" },
				yaml = { "prettierd" },
			},
		},
		keys = {
			{
				"<C-f>",
				function()
					require("conform").format()
				end,
				desc = "Format current buffer",
			},
		},
	},
  -- edit surrounding pairs, HTML support
  -- TODO: Keybinds for editing pairs?
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
  -- Live webserver with auto update
  {
    "ray-x/web-tools.nvim",
    lazy = false;
    config = function()
      require("web-tools").setup({
        keymaps = {
          rename = nil,
          repeat_rename = '.',
        },
        hurl = {
          show_headers = false,
          floating = false,
          formatters = {
            json = { 'jq' },
            html = { 'prettierd', '--parser', 'html' },
          },
        },
      })
    end,
  },
  -- lspsaga
  {
    'nvimdev/lspsaga.nvim',
    config = function()
        require('lspsaga').setup({})
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons'     -- optional
    },
  },
}
