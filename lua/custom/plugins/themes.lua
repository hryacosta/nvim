return {
  {
    'projekt0n/github-nvim-theme',
    config = function()
      require('github-theme').setup {
        -- options = {
        --   transparent = true,
        -- },
        -- styles = {
        --   sidebars = 'transparent',
        --   floats = 'transparent',
        -- },
      }

      -- vim.cmd 'colorscheme github_dark_default'
      -- vim.cmd 'colorscheme github_dark_high_contrast'
      -- vim.cmd 'colorscheme github_dark'
      -- vim.cmd 'colorscheme github_dark_colorblind'
      -- vim.cmd 'colorscheme github_dark_dimmed'
    end,
  },
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = function()
      require('gruvbox').setup {
        terminal_colors = true,
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          emphasis = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true,
        contrast = 'hard',
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = false,
      }

      vim.o.background = 'dark'
      vim.cmd 'colorscheme gruvbox'
    end,
  },
  -- {
  --   'savq/melange-nvim',
  --   config = function()
  --     -- vim.cmd 'set termguicolors'
  --     -- vim.cmd 'colorscheme melange'
  --   end,
  -- },
}
