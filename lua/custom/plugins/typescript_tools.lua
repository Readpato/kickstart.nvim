local capabilities = require('blink.cmp').get_lsp_capabilities()

return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {
    filetypes = {
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact',
      'vue',
    },
    settings = {
      capabilities = capabilities,
      single_file_support = false,
      tsserver_plugins = {
        '@vue/typescript-plugin',
        '@vue/language-server',
      },
    },
  },
}
