return {
  {
    'projekt0n/github-nvim-theme',
    config = function()
      require('github-theme').setup {
        options = {
          transparent = true,
        },
        styles = {
          sidebars = 'transparent',
          floats = 'transparent',
        },
      }

      -- vim.cmd 'colorscheme github_dark_default'
      -- vim.cmd 'colorscheme github_dark_high_contrast'
      -- vim.cmd 'colorscheme github_dark'
      vim.cmd 'colorscheme github_dark_colorblind'
      -- vim.cmd 'colorscheme github_dark_dimmed'
    end,
  },
}
