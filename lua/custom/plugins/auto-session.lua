return {
  {
    'rmagatti/auto-session',
    lazy = false,
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('auto-session').setup {
        log_level = 'error',

        auto_restore_enabled = true,
        auto_session_suppress_dirs = { '~/', '~/Dev', '~/Downloads/', '~/Desktop', '~/Documents/', '~/Projectos' },

        auto_session_enabled = true,
        auto_save_enabled = true,
        auto_session_enable_last_session = vim.loop.cwd() == vim.loop.os_homedir(),
      }

      local keymap = vim.keymap

      keymap.set('n', '<leader>wr', '<cmd>SessionRestore<CR>', { desc = 'Resore session for cwd' })
      keymap.set('n', '<leader>wa', '<cmd>SessionSave<CR>', { desc = 'Save session for auto session root dir' })
    end,
  },
}
