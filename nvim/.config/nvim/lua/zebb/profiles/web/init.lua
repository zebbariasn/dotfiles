-- Web fullstack profile (default): JS/TS, Svelte, Tailwind, GraphQL, Prisma, Python
return {
  -- LSP servers installed by mason-lspconfig
  lsp = {
    "ts_ls",
    "html",
    "cssls",
    "tailwindcss",
    "svelte",
    "graphql",
    "emmet_ls",
    "prismals",
    "pyright",
    "eslint",
  },

  -- formatters / linters installed by mason-tool-installer
  tools = {
    "prettier",
    "isort",
    "black",
    "pylint",
    "eslint_d",
  },

  -- treesitter parsers
  parsers = {
    "javascript",
    "typescript",
    "tsx",
    "html",
    "css",
    "svelte",
    "graphql",
    "python",
  },

  -- conform.nvim formatters_by_ft
  formatters = {
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    svelte = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    graphql = { "prettier" },
    liquid = { "prettier" },
    python = { "isort", "black" },
  },

  -- nvim-lint linters_by_ft
  linters = {
    python = { "pylint" },
  },
}
