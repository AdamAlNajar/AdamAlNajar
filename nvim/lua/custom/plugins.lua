local plugins = {
  -- DAP UI configuration for both Python and C++
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = {
      "mfussenegger/nvim-dap", 
      "nvim-neotest/nvim-nio"
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },

  -- DAP core support
  {
    "mfussenegger/nvim-dap",
    config = function(_, _)
      require("core.utils").load_mappings("dap")
    end
  },

  

  -- Null-ls for static analysis and linters (Python and C++)
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },

  -- Mason for managing tools (Python and C++)
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- Python tools
        "black",
        "debugpy",
        "mypy",
        "ruff-lsp",
        "pyright",
        -- C++ tools
        "clangd",
        "clang-format",
        "codelldb",
      },
    },
  },

  -- Python LSP with Pyright
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Pyright for Python
      require("lspconfig").pyright.setup{}
    end
  },

  -- C++ LSP with clangd
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Clangd for C++
      require("lspconfig").clangd.setup{}
    end
  },

  -- Additional optional C++ plugin for debugging (Codelldb)
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {}
    },
  },
}

return plugins
