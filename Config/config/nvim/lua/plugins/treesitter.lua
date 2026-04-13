return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local treesitter = require("nvim-treesitter.config")

    -- configurate treesitter
    treesitter.setup({
      -- activate syntaxic coloration
      highlight = {
        enable = true,
      },
      -- activate impoved indentation
      indent = { enable = true },

      -- installed annd configured languages
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "lua",
        "python",
      },
      -- when typing <Ctrl-space> select current bloc
      -- specific to language
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}

