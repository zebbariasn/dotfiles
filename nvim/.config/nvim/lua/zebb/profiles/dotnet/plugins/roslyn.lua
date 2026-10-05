return {
  {
    "williamboman/mason.nvim",
    opts = {
      -- roslyn language server is published in a community registry
      registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
      },
    },
  },
  {
    "seblyng/roslyn.nvim",
    ft = "cs",
    dependencies = { "williamboman/mason.nvim" },
    opts = {},
  },
}
