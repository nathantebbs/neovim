return {
  { -- You can easily change to a different colorscheme.
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'gruvbox'

      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
  },
}
