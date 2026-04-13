return {
  "echasnovski/mini.indentscope",
  version = false,  -- always use latest
  event = "BufReadPre",
  opts = {
    symbol = "│",
    options = {
      try_as_border = true,
    },
  },
}
