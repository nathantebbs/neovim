-- Author: Nathan Tebbs
-- Edited: Feb 10th, 2025

-- BASIC SETTINGS:
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true
vim.g.noexpandtab = true


vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.tabstop = 8
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.termguicolors = true

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule(function()
    vim.opt.clipboard = 'unnamedplus'
end)


-- KEYMAPS:
-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Autocmds:
-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
	vim.highlight.on_yank()
    end,
})

-- Install lazy vim plugin manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
    if vim.v.shell_error ~= 0 then
	error('Error cloning lazy.nvim:\n' .. out)
    end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup
{
    -- COLORSCHEME:
    {
	"rebelot/kanagawa.nvim",
	priority = 1000,
	lazy = false,
	opts = {},
	init = function() 
	    vim.cmd("colorscheme kanagawa")
	end,
    },

    -- GENERAL:
    {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {},
	keys = {
	    {
		"<leader>?",
		function()
		    require("which-key").show({ global = false })
		end,
		desc = "Buffer Local Keymaps (which-key)",
	    },
	},
    },

    {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
	    bigfile = { enabled = true },
	    dashboard = { enabled = true },
	    explorer = { enabled = true },
	    indent = { enabled = true },
	    input = { enabled = true },
	    picker = { enabled = true },
	    notifier = { enabled = true },
	    quickfile = { enabled = true },
	    scope = { enabled = true },
	    scroll = { enabled = false },
	    statuscolumn = { enabled = true },
	    words = { enabled = true },
	},
	keys = {
	    {"<leader>ff", function() Snacks.picker.smart() end, desc="Smart Find Files"},
	    {"<leader>.", function() Snacks.picker.grep() end, desc="Find Words In Cur Buff"},
	    {"<leader>,", function() Snacks.picker.buffers() end, desc="Find Words In Cur Buff"},
	},
    },

    -- LSP:
    { "neovim/nvim-lspconfig" },


    -- ICONS:
    { "echasnovski/mini.icons", opts = {} },

    {  "nvim-tree/nvim-web-devicons", opts = {} },

    -- SYNTAX HIGHLIGHTING
    { "nvim-treesitter/nvim-treesitter", opts = {} },
}

require'lspconfig'.pyright.setup{}
require'lspconfig'.lua_ls.setup{}
require'lspconfig'.clangd.setup{}
require'lspconfig'.ts_ls.setup{}
