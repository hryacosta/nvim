return {
  {
    'rmagatti/auto-session',
    lazy = false,
    config = function()
      require('auto-session').setup {
        auto_restore_enabled = true,
        auto_session_suppress_dirs = { '~/', '~/Dev', '~/Downloads/', '~/Desktop', '~/Documents/' },
        auto_session_enabled = true,
        auto_save_enabled = true,
      }

      local keymap = vim.keymap

      keymap.set('n', '<leader>wr', '<cmd>SessionRestore<CR>', { desc = 'Resore session for cwd' })
      keymap.set('n', '<leader>wa', '<cmd>SessionSave<CR>', { desc = 'Save session for auto session root dir' })
    end,
  },
}
