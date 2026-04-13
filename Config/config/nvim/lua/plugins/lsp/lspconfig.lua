return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    -- Will allow the nvim-cmp autocomplete plugin to be populatedwith
    -- with the LSP results
    "hrsh7th/cmp-nvim-lsp",
    -- Adds "code actions" such as smart file renaming, etc.
    { "antosha417/nvim-lsp-file-operations", config = true },
    -- Useful for editing Lua files specific to the Neovim configuration
    -- In particular, to avoid the "Undefined global `vim`" error
    { "folke/lazydev.nvim", opts = {} },
  },
  keys = {
    { "A-i", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n" } },
    { "gd", vim.lsp.buf.definition, desc = "Go to definition", mode = "n" },
    { "gD", vim.lsp.buf.declaration, desc = "Go to declaration", mode = "n" },
    { "gs", vim.lsp.buf.signature_help, desc = "Show LSP signature help", mode = "n" },
    { "<leader>rn", vim.lsp.buf.rename, desc = "Smart rename", mode = "n" },
    { "gR", "<cmd>Telescope lsp_references<CR>", desc = "Show LSP references", mode = "n" },
    { "gi", "<cmd>Telescope lsp_implementations<CR>", desc = "Show LSP implementations", mode = "n" },
    { "gt", "<cmd>Telescope lsp_type_definitions<CR>", desc = "Show LSP type definitions", mode = "n" },
    { "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", desc = "Show buffer diagnostics", mode = "n" },
    {
      "[d",
      function()
        vim.diagnostic.jump({ count = -1, float = true })
      end,
      desc = "Go to previous diagnostic",
      mode = "n",
    },
    {
      "]d",
      function()
        vim.diagnostic.jump({ count = 1, float = true })
      end,
      desc = "Go to next diagnostic",
      mode = "n",
    },
    { "K", vim.lsp.buf.hover, desc = "Show documentation for what is under cursor", mode = "n" },
    { "<leader>F", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", desc = "Format buffer", mode = { "n", "x" } },
    { "<leader>rs", ":LspRestart<CR>", desc = "Restart LSP", mode = "n" },
  },
  config = function()
    -- Customize error signs
    vim.diagnostic.config({
      underline = true,
      virtual_text = { prefix = "", },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.INFO] = "",
          [vim.diagnostic.severity.HINT] = "󰌵",
        },
      },
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        -- Activate Inlay Hints (types for auto, parameter names)
        if vim.lsp.inlay_hint then
          vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
        end
      end,
    })

    -- languages
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    vim.lsp.config.clangd = vim.tbl_deep_extend("force", vim.lsp.config.clangd or {}, {
      capabilities = capabilities,
      filetypes = { "c", "cpp", "cc", "cxx", "objc", "objcpp", "cuda", "h", "hh", "hpp", "hxx" },
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--clang-tidy-checks=*",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--function-arg-placeholders",
          "--all-scopes-completion",
        },
        settings = {
          clangd = {
            diagnostics = {
              warningsAsErrors = false,
            }
          }
        }
    })

    vim.lsp.config.bashls = vim.tbl_deep_extend("force", vim.lsp.config.bashls or {}, {
      capabilities = capabilities,
    })

    vim.lsp.config.cmake = vim.tbl_deep_extend("force", vim.lsp.config.cmake or {}, {
      capabilities = capabilities,
    })

    local notify = vim.lsp.handlers["textDocument/publishDiagnostics"]
    vim.lsp.handlers["textDocument/publishDiagnostics"] = function(_, result, ctx, config)
      for _, diagnostic in ipairs(result.diagnostics) do
        if diagnostic.source == "clang-tidy" then
          diagnostic.severity = vim.diagnostic.severity.WARN
        end
      end
      notify(_, result, ctx, config)
    end

    vim.lsp.enable("clangd")
    vim.lsp.enable("bashls")
    vim.lsp.enable("cmake")
  end,
}
