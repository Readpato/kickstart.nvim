return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    dim = {
      enabled = true,
    },
    indent = {
      enabled = true,
    },
    dashboard = {
      example = 'doom',
    },
    lazygit = {
      enabled = true,
    },
  },
  keys = {
    {
      '<leader>zd',
      function()
        Snacks.dim()
      end,
      desc = 'Activate dim',
    },
    {
      '<leader>zi',
      function()
        Snacks.indent.enable()
      end,
      desc = 'Activate indent',
    },
    {
      '<leader>gg',
      function()
        Snacks.lazygit()
      end,
      desc = 'Toggle lazygit',
    },
  },
}
