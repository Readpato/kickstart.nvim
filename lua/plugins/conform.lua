return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    formatters = {
      prettierd = {
        require_cwd = true,
      },
      eslint_d = {
        format_after_save = {
          lsp_format = 'fallback',
        },
      },
    },
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true }
      if disable_filetypes[vim.bo[bufnr].filetype] then
        return nil
      else
        return {
          timeout_ms = 500,
          lsp_format = 'fallback',
        }
      end
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      vue = { 'eslint_d' },
      typescriptreact = { 'prettierd' },
      javascriptreact = { 'prettierd' },
      typescript = function(bufnr)
        if require('conform').get_formatter_info('prettierd', bufnr).available then
          return { 'prettierd' }
        else
          return { 'eslint_d' }
        end
      end,
      javascript = function(bufnr)
        if require('conform').get_formatter_info('prettierd', bufnr).available then
          return { 'prettierd' }
        else
          return { 'eslint_d' }
        end
      end,
      json = function(bufnr)
        if require('conform').get_formatter_info('prettierd', bufnr).available then
          return { 'prettierd' }
        else
          return { 'eslint_d' }
        end
      end,
      jsonc = function(bufnr)
        if require('conform').get_formatter_info('prettierd', bufnr).available then
          return { 'prettierd' }
        else
          return { 'eslint_d' }
        end
      end,
    },
  },
}
