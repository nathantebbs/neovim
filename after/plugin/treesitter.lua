require('nvim-treesitter.configs').setup {
	ensure_installed = { 'vim', 'vimdoc', 'lua', 'cpp', 'html', 'css' },
  autotag = {enable = true},

	auto_install = false,

	highlight = {enable = true},

	indent = {enable = true},
}
