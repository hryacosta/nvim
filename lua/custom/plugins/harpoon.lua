return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
        key = function()
          return vim.loop.cwd()
        end,
      },
    },
    keys = {
      {
        '<leader>a',
        function()
          -- local harpoon = require "harpoon.mark"
          -- harpoon.add_file()
          local harpoon = require 'harpoon'
          harpoon:list():append()
        end,
        desc = 'harpoon mark file',
      },
      {
        '<C-e>',
        function()
          -- harpoon.toggle_quick_menu()
          local harpoon = require 'harpoon'
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
      },
    },
  },
}
