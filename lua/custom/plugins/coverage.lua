return {
  {
    'andythigpen/nvim-coverage',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    rocks = { 'lua-xmlreader' },
    config = function()
      require('coverage').setup()
    end,
    init = function()
      require('coverage').setup()
    end,
  },
}
