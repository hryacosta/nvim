return {
  {
    'projekt0n/github-nvim-theme',
    config = function()
      require('github-theme').setup {}
      -- vim.cmd 'colorscheme github_dark_default'
      -- vim.cmd 'colorscheme github_dark_high_contrast'
      -- vim.cmd 'colorscheme github_dark'
      vim.cmd 'colorscheme github_dark_colorblind'
      -- vim.cmd 'colorscheme github_dark_dimmed'

      -- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
      -- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    end,
  },
}
