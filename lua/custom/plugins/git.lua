return {
  {
    'kdheepak/lazygit.nvim',
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('telescope').load_extension 'lazygit'
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      {
        'isak102/telescope-git-file-history.nvim',
        dependencies = {
          'nvim-lua/plenary.nvim',
          'tpope/vim-fugitive',
        },
      },
    },
  },
}
