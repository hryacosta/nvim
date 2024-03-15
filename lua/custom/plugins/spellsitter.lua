return {
  {
    -- Optional but recommended
    -- 'nvim-treesitter/nvim-treesitter',
    'lewis6991/spellsitter.nvim',
    lazy = false,
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('spellsitter').setup()
    end,
  },
}
