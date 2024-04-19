return {
  lsp_fallback = true,

  formatters_by_ft = {
    lua = { "stylua" },
    typescript = { "prettier" },
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },

    ["*"] = { "trim_whitespace" },
  },
}

