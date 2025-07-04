return {
  'L3MON4D3/LuaSnip',
  version = 'v2.*',
  build = 'make install_jsregexp',
  dependencies = {
    'rafamadriz/friendly-snippets',
  },
  config = function()
    local ls = require 'luasnip'

    ls.config.set_config {
      enable_autosnippets = true,
      update_events = 'TextChanged,TextChangedI',
      delete_check_events = 'TextChanged',
      store_selection_keys = '<Tab>',
    }

    -- Key mappings for snippet navigation
    vim.keymap.set({ 'i' }, '<C-K>', function()
      if ls.expand_or_jumpable() then
        ls.expand_or_jump()
      end
    end, { silent = true })

    vim.keymap.set({ 'i', 's' }, '<C-L>', function()
      if ls.jumpable(1) then
        ls.jump(1)
      end
    end, { silent = true })

    vim.keymap.set({ 'i', 's' }, '<C-J>', function()
      if ls.jumpable(-1) then
        ls.jump(-1)
      end
    end, { silent = true })

    vim.keymap.set({ 'i', 's' }, '<C-E>', function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, { silent = true })

    -- Load friendly-snippets (community snippets)
    require('luasnip.loaders.from_vscode').lazy_load()

    -- Load your custom snippets from the correct directory
    local config_path = vim.fn.stdpath 'config'
    require('luasnip.loaders.from_vscode').lazy_load {
      paths = { config_path .. '/snippets/' },
    }

    -- Set up filetype extensions for Vue
    -- ls.filetype_extend('vue', { 'html', 'javascript', 'css' })

    -- Optional: Reload snippets when editing snippet files
    vim.api.nvim_create_autocmd('BufWritePost', {
      pattern = '*/snippets/*.json',
      callback = function()
        require('luasnip.loaders.from_vscode').lazy_load {
          paths = { vim.fn.stdpath 'config' .. '/snippets/' },
        }
        vim.notify('Snippets reloaded!', vim.log.levels.INFO)
      end,
    })
  end,
}
