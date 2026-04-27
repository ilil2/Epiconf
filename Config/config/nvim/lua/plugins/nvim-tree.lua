return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      -- view = {
      --   side = "right",
      -- },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
          hint = "󰌵",
          info = "",
          warning = "",
          error = "",
        },
      },
      renderer = {
        highlight_diagnostics = true,
      },
    })

    vim.keymap.set(
      "n",
      "<C-t>",
      "<cmd>NvimTreeFindFileToggle<CR>",
      { desc = "Open/close file tree" }
    )
  end,
}
