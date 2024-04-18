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
}
