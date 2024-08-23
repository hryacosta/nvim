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

      -- vim.o.background = 'dark'
      -- vim.cmd 'colorscheme gruvbox'
    end,
  },
  {
    'rebelot/kanagawa.nvim',
    config = function()
      require('kanagawa').setup {
        compile = false, -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        -- functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        -- typeStyle = {},
        transparent = false, -- do not set background color
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        -- colors = { -- add/modify theme and palette colors
        --   palette = {},
        --   theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        -- },
        -- overrides = function(colors) -- add/modify highlights
        --   return {}
        -- end,
        theme = 'lotus', -- Load "wave" theme when 'background' option is not set
        background = { -- map the value of 'background' option to a theme
          dark = 'wave', -- try "dragon" !
          light = 'lotus',
        },
      }

      -- vim.cmd 'colorscheme kanagawa'
    end,
  },
}
