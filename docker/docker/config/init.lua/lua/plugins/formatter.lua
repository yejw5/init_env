return {
  -- 自动格式化工具
  {
    'stevearc/conform.nvim',
    lazy = false,
    opts = {
      notify_on_error = true,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        sh = { 'shfmt' },
        html = { 'djlint' },
        go = { 'gofmt', 'goimports' },
        c = { 'clang_format' },
        cpp = { 'clang_format' },
        python = { 'yapf' },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        -- javascript = { { "prettierd", "prettier" } },
      },
      -- formatters = {
      --   clang_format = {
      --     prepend_args = { '--style=file', '--fallback-style=LLVM' },
      --   },
      --   shfmt = {
      --     prepend_args = { '-i', '4' },
      --   },
      -- },
    },
  }
}
