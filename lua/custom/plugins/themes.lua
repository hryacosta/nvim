return {

  -- Or with configuration
  {
    'projekt0n/github-nvim-theme',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('github-theme').setup {}
      -- vim.cmd 'colorscheme github_dark'
      vim.cmd 'colorscheme github_dark_default'
    end,
  },
  {
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      -- vim.cmd 'colorscheme rose-pine'
      -- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
      -- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    end,
  },
  {
    'tjdevries/colorbuddy.nvim',
    as = 'colorbuddy',
    config = function()
      -- vim.cmd 'colorscheme colorbuddy'
      -- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
      -- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    end,
  },
  {
    'Shatur/neovim-ayu',
    config = function()
      -- vim.cmd 'colorscheme ayu'
    end,
  },
  {
    'tiagovla/tokyodark.nvim',
    opts = {
      -- custom options here
    },
    config = function(_, opts)
      require('tokyodark').setup(opts) -- calling setup is optional
      -- vim.cmd [[colorscheme tokyodark]]
    end,
  },
}
