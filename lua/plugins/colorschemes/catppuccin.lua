return {
  'catppuccin/nvim',
  lazy = false,
  name = 'catppuccin',
  priority = 1000,
  opts = {
    flavour = 'mocha',
    transparent_background = false,
    no_italic = true,
    integrations = {
      blink_cmp = true,
    },
    -- color_overrides = {
    --   mocha = {
    --     base = '#000000',
    --     mantle = '#000000',
    --     crust = '#000000',
    --   },
    -- },
  },
}
