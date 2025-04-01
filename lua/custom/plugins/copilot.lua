return {

  {
    'zbirenbaum/copilot.lua',
    event = 'InsertEnter',
    cmd = 'Copilot',
    build = ':Copilot auth',
    opts = {
      panel = { enabled = false, auto_refresh = true },
      suggestion = { enabled = true, auto_trigger = true },
      filetypes = {
        markdown = true,
        help = true,
        typescript = true,
        javascript = true,
        rust = true,
        go = true,
        dart = true,
      },
    },
    config = function(opts)
      require('copilot').setup(opts)
    end,
  },
  {
    'zbirenbaum/copilot-cmp',
    opts = {},
    config = function(_, opts)
      local copilot_cmp = require 'copilot_cmp'
      copilot_cmp.setup {
        sources = {
          -- Copilot Source
          { name = 'copilot', group_index = 2 },
          -- Other Sources
          { name = 'nvim_lsp', group_index = 2 },
          { name = 'path', group_index = 2 },
          { name = 'luasnip', group_index = 2 },
        },
      }
    end,
  },
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'zbirenbaum/copilot.lua' },
      { 'nvim-lua/plenary.nvim' },
    },
    config = function()
      require('CopilotChat').setup()
    end,
  },
}
