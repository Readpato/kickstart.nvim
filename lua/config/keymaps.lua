-- [[ Basic Keymaps ]]
local wk = require 'which-key'

wk.add {
  {
    mode = { 'n' },
    -- Buffers
    { '<leader>b\\', '<cmd>vs<cr>', desc = 'Vertically Split [B]uffer' },
    { '<leader>b|', '<cmd>vs<cr>', desc = 'Horizontally Split [B]uffer' },
    { '<leader>bc', '<cmd>:bd<cr>', desc = 'Horizontally Split [B]uffer' },
    { '<leader>bC', '<cmd>:%bd<cr>', desc = 'Horizontally Split [B]uffer' },

    -- Diagnostics
    { '<leader>q', vim.diagnostic.setloclist, desc = 'Open diagnostic [Q]uickfix list' },

    -- Miscellaneous
    { '<leader>w', '<cmd>w<cr>', desc = 'Write', hidden = true },

    -- Search
    { '<Esc>', '<cmd>nohlsearch<CR>' },

    -- Window Navigation
    { '<C-h>', '<C-w><C-h>', desc = 'Move focus to the left window' },
    { '<C-l>', '<C-w><C-l>', desc = 'Move focus to the rightwindow' },
    { '<C-j>', '<C-w><C-j>', desc = 'Move focus to the lower window' },
    { '<C-k>', '<C-w><C-k>', desc = 'Move focus to the upper window' },
    { '<C-d>', '<C-d>zz', desc = 'Jump half a screen down and center' },
    { '<C-u>', '<C-u>zz', desc = 'Jump half a screen up and center' },
  },
}

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
