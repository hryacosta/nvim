return {
  {
    'hankchiutw/flutter-reload.vim',
    lazy = false,
  },
  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = true,
    init = function()
      require('flutter-tools').setup {}
    end,
  },
}
