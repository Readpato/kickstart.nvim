return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local harpoon = require 'harpoon'

    harpoon:setup {
      settings = {
        save_on_toggle = false,
        sync_on_ui_close = false,
      },
    }

    for i = 1, 4 do
      vim.keymap.set('n', '<leader>z' .. i, function()
        harpoon:list():select(i)
      end, { desc = '[Z]oomie: Go to harpoon ' .. i })
    end

    vim.keymap.set('n', '<leader>za', function()
      harpoon:list():add()
    end, { desc = '[Z]oomie: [A]dd file to harpoon' })

    vim.keymap.set('n', '<C-e>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Toggle harpoon menu' })
  end,
}
