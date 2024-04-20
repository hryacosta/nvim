return {

  {
    'projekt0n/github-nvim-theme',
    config = function()
      require('github-theme').setup {}
      -- vim.cmd 'colorscheme github_dark_default'
      -- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
      -- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    end,
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('rose-pine').setup {}
      vim.cmd 'colorscheme rose-pine'
      -- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
      -- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    end,
  },
  {
    -- 'iruzo/matrix-nvim',
    'luisiacc/the-matrix.nvim',
    config = function()
      -- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
      -- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })

      -- this will setup snipes color background
      -- vim.api.nvim_set_hl(0, 'CmpNormal', { bg = '#FF0000' })

      -- require('cmp').setup {
      --   window = {
      --     completion = {
      --       border = 'rounded',
      --       winhighlight = 'Normal:CmpNormal',
      --     },
      --   },
      -- }

      -- vim.cmd 'colorscheme thematrix'
    end,
  },
  {
    'rebelot/kanagawa.nvim',

    config = function()
      require('kanagawa').setup {
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = 'none',
              },
            },
          },
        },
        overrides = function(colors)
          local theme = colors.theme
          return {
            NormalFloat = { bg = 'none' },
            FloatBorder = { bg = 'none' },
            FloatTitle = { bg = 'none' },

            -- Save an hlgroup with dark background and dimmed foreground
            -- so that you can use it where your still want darker windows.
            -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
            NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

            -- Popular plugins that open floats will link to NormalFloat by default;
            -- set their background accordingly if you wish to keep them dark and borderless
            LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          }
        end,
        theme = 'dragon',
        background = {
          dark = 'dragon',
          light = 'lotus',
        },
      }
      vim.api.nvim_set_hl(0, 'CmpNormal', { bg = '#FF0000' })

      require('cmp').setup {
        window = {
          completion = {
            border = 'rounded',
            winhighlight = 'Normal:CmpNormal',
          },
        },
      }

      vim.cmd 'colorscheme kanagawa'
    end,
  },
}
