return {
  {
    'kevinhwang91/nvim-hlslens',
    dependecies = {
      {
        'kevinhwang91/nvim-ufo',
        dependencies = { 'kevinhwang91/promise-async' },
      },
    },
    config = function()
      require('hlslens').setup()
    end,
  },
}
