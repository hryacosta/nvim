return {

  {
    'projekt0n/github-nvim-theme',
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('github-theme').setup {}
      -- vim.cmd 'colorscheme github_dark_tritanopia'
    end,
  },
  {
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      require('rose-pine').setup {}
      vim.cmd 'colorscheme rose-pine'
      -- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
      -- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    end,
  },
}
