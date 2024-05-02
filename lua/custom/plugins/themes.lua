return {

  {
    'projekt0n/github-nvim-theme',
    config = function()
      require('github-theme').setup {}
      -- vim.cmd 'colorscheme github_dark_default'
      -- vim.cmd 'colorscheme github_dark_high_contrast'
      -- vim.cmd 'colorscheme github_dark'
      -- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
      -- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })

      vim.cmd 'colorscheme github_dark_dimmed'
      -- vim.api.nvim_set_hl(0, 'CmpNormal', { bg = '#FF0000' })

      -- require('cmp').setup {
      --   window = {
      --     completion = {
      --       border = 'rounded',
      --       winhighlight = 'Normal:CmpNormal',
      --     },
      --   },
      -- }
    end,
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('rose-pine').setup {}
      -- vim.cmd 'colorscheme rose-pine'
      -- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
      -- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    end,
  },
}
