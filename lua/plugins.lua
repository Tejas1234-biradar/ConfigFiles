require("lspconfig").clangd.setup({
  cmd = {
    "clangd",
    "--limit-results=500",
    "--limit-references=100",
    "--malloc-trim",
    "--background-index",
    "--clang-tidy",
    "--completion-style=detailed",
    "--header-insertion=iwyu",
    "--suggest-missing-includes",
    "--log=verbose",
  },
})
-- ~/.config/nvim/lua/plugins.lua

-- Ensure you return a table of your plugins
return {

  -- Other plugins can be listed here
  --

  -- Popular Themes
  { "ellisonleao/gruvbox.nvim" }, -- Gruvbox
  { "navarasu/onedark.nvim" }, -- Onedark
  { "catppuccin/nvim", name = "catppuccin" }, -- Catppuccin
  { "shaunsingh/nord.nvim" }, -- Nord
  { "folke/tokyonight.nvim" }, -- TokyoNight
  { "talha-akram/noctis.nvim" },
  { "projekt0n/github-nvim-theme" }, -- GitHub Theme
  { "EdenEast/nightfox.nvim" }, -- Carbonfox (Nightfox Variant)
  { "drewtempelmeyer/palenight.vim" }, -- Palenight
  { "jaredgorski/spacecamp" }, -- Spacecamp
  { "doums/darcula" }, -- Darcula
  { "mhartington/oceanic-next" }, -- Oceanic Next
  { "sjl/badwolf" }, -- Badwolf
  { "NLKNguyen/papercolor-theme" }, -- PaperColor
  { "dracula/vim" }, -- Dracula
  { "nanotech/jellybeans.vim" }, -- Jellybeans
  { "NTBBloodbath/doom-one.nvim" }, -- Doom One
  { "lifepillar/vim-solarized8" }, -- Solarized8
  { "sainnhe/edge" }, -- Edge
  { "cocopon/iceberg.vim" }, -- Iceberg
  { "loctvl842/monokai-pro.nvim" }, -- Monokai Pro

  -- Fancy & Unique Themes
  { "marko-cerovac/material.nvim" }, -- Material
  { "EdenEast/nightfox.nvim" }, -- Nightfox
  { "Mofiqul/dracula.nvim" }, -- Dracula
  { "sainnhe/everforest" }, -- Everforest
  { "rose-pine/neovim", name = "rose-pine" }, -- Rose Pine

  -- Dark & Futuristic Themes
  { "ishan9299/nvim-solarized-lua" }, -- Solarized
  { "rebelot/kanagawa.nvim" }, -- Kanagawa
  { "Shatur/neovim-ayu" }, -- Ayu
  { "glepnir/zephyr-nvim" }, -- Zephyr

  -- Minimalist Themes
  { "sainnhe/gruvbox-material" }, -- PaperColor/Material Gruvbox
  { "sainnhe/edge" }, -- Edge
  { "tanvirtin/monokai.nvim" }, -- Monokai
  {
  "EdenEast/nightfox.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd("colorscheme carbonfox")
  end,
  },

  {
    "marcussimonsen/let-it-snow.nvim",
    cmd = "LetItSnow", -- Wait with loading until command is run
    opts = {},
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },

  { "nvzone/timerly", dependencies = {
    "nvzone/volt",
  } },
  --
  -- {
  --   "benlubas/molten-nvim",
  --   version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
  --   dependencies = { "3rd/image.nvim" },
  --   build = ":UpdateRemotePlugins",
  --   init = function()
  --     -- these are examples, not defaults. Please see the readme
  --     vim.g.molten_image_provider = "image.nvim"
  --     vim.g.molten_output_win_max_height = 20
  --   end,
  -- },
  --
  -- {
  --   -- see the image.nvim readme for more information about configuring this plugin
  --   "3rd/image.nvim",
  --   opts = {
  --     backend = "kitty", -- whatever backend you would like to use
  --     max_width = 100,
  --     max_height = 12,
  --     max_height_window_percentage = math.huge,
  --     max_width_window_percentage = math.huge,
  --     window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
  --     window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
  --   },
  -- },
  --
  {
    "iamcco/markdown-preview.nvim",
    config = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set("n", "<leader>U", vim.cmd.UndotreeToggle, { desc = "Toggle UndoTree" })
    end,
  },

  {
    "preservim/vim-markdown", -- A popular markdown plugin
    ft = "markdown", -- Load only for markdown files
    config = function()
      vim.g.vim_markdown_folding_disabled = 1 -- Example setting
    end,
  },
  {
    "godlygeek/tabular", -- For aligning text, often used with markdown
    ft = "markdown",
  },
  {
    "plasticboy/vim-markdown", -- Another markdown plugin
    ft = "markdown",
  },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },

  -- Add the toggleterm.nvim plugin configuration
  {
    "mg979/vim-visual-multi",
    branch = "master",
    config = function()
      -- Optional: customize keybindings or settings here
    end,
  },
  { "akinsho/toggleterm.nvim", version = "*", config = true },
  { "prisma/vim-prisma" },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
      },
    },
  },

  "neovim/nvim-lspconfig",
  dependencies = {
    "jose-elias-alvarez/typescript.nvim",
  },
  config = function()
    -- Ensure lspconfig and typescript are loaded
    local lspconfig = require("lspconfig")
    local ts = require("typescript")

    -- Configure TypeScript and JavaScript
    ts.setup({
      server = {
        on_attach = function(client, bufnr)
          -- Add your custom on_attach function here, if any
        end,
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      },
    })

    -- Optionally configure additional LSP settings
    lspconfig.tsserver.setup({
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
      cmd = { "typescript-language-server", "--stdio" },
      settings = {
        javascript = {
          suggest = {
            jsxAttributeCompletionStyle = "auto", -- or "never" to disable JSX suggestions in JS files
          },
        },
        completions = {
          completeFunctionCalls = true,
        },
      },
    })
  end,

  -- Add Telescope and its dependencies
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
      require('telescope').setup({
        -- Optional: add any telescope configuration here
      })
    end,
  },
}
