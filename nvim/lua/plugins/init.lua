return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    event = "User FilePost",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "eslint-lsp",
        "clangd",
        "gopls",
        "js-debug-adapter",
        "typescript-language-server",
        "rust-analyzer",
      },
    },
  },
  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "typescript",
        "javascript",
        "go",
        "c",
        "cpp"
  		},
  	},
  },
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require "configs.lint"
    end
  },
  {
    "Exafunction/codeium.vim",
    lazy = false,
  },
  {
      'MeanderingProgrammer/render-markdown.nvim',
      -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
      -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
      dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
      ---@module 'render-markdown'
      ---@type render.md.UserConfig
      opts = {},
  },
  {
      "lervag/vimtex",
      lazy = false,
      ft = { "tex" },
      init = function()
        vim.g.tex_flavor = "latex"
        -- vim.g.vimtex_quickfix_mode = 0
        vim.g.vimtex_mappings_enabled = 0
        vim.g.vimtex_indent_enabled = 0

        vim.g.vimtex_view_method = "zathura"
        vim.g.vimtex_context_pdf_viewer = "zathura"
      end,
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^6', -- Recommended
    lazy = false, -- This plugin is already lazy
    [ "rust-analyzer" ] =  {
      cargo = {
        allFeatures = true,
      }
    }
  }
}
