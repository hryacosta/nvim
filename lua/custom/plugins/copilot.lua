return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    opts = {
      suggestion = {
        enable = false,
      },
      panel = {
        enable = false,
      },
    },
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      {
        'zbirenbaum/copilot-cmp',
        config = function(_, opts)
          require('copilot_cmp').setup(opts)
        end,
      },
    },
    opts = {
      sources = {
        { name = 'nvim_lsp', group_index = 2 },
        { name = 'copilot', group_index = 2 },
        { name = 'luasnip', group_index = 2 },
        { name = 'buffer', group_index = 2 },
        { name = 'nvim_lua', group_index = 2 },
        { name = 'path', group_index = 2 },
      },
    },
  },
}
