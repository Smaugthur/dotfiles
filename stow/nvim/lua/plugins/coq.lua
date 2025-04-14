return {
    {
      "neovim/nvim-lspconfig", -- REQUIRED: for native Neovim LSP integration
      lazy = false, -- REQUIRED: tell lazy.nvim to start this plugin at startup
      opts = { inlay_hints = {enabled = false} },
      dependencies = {
        -- main one
        { "ms-jpq/coq_nvim", branch = "coq" },

        -- 9000+ Snippets
        { "ms-jpq/coq.artifacts", branch = "artifacts" },

        -- lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
        -- Need to **configure separately**
        { 'ms-jpq/coq.thirdparty', branch = "3p" },
        -- - shell repl
        -- - nvim lua api
        -- - scientific calculator
        -- - comment banner
        -- - etc
        -- MASON
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
      },
      init = function()
        vim.g.coq_settings = {
            auto_start = 'shut-up', -- if you want to start COQ at startup
            -- Your COQ settings here
        }
      end,
      config = function()
        require("mason").setup()
        require("mason-lspconfig").setup{
          ensure_installed = {"lua_ls", "eslint", 'ts_ls', 'pyright', 'gopls'},
        }
        local lspconfig = require('lspconfig')
        -- lspconfig.ts_ls.setup({})
        -- lspconfig.eslint.setup({})
        -- lspconfig.pyright.setup({})
        -- lspconfig.gopls.setup({})
      end,
  }, 
  {
      'mrcjkb/rustaceanvim',
      version = '^5', -- Recommended
      lazy = false, -- This plugin is already lazy
  }
}
