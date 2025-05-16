return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",      -- compila/atualiza parsers no :Lazy sync
  event = { "BufReadPost", "BufNewFile" }, -- só carrega quando abrir arquivo
  opts = {
    ensure_installed = { "lua", "vim", "vimdoc", "bash", "json", "markdown" },
    auto_install     = false,   -- não tenta baixar parser faltando na hora
    sync_install     = false,
    highlight        = { enable = true },
    indent           = { enable = true },
  },
  config = function(_, opts)
    -- diz explicitamente quais compiladores tentar – na ordem
    require("nvim-treesitter.install").compilers = { "gcc", "clang", "zig" }
    require("nvim-treesitter.configs").setup(opts)
  end,
}