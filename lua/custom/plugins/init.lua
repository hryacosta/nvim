-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
vim.keymap.set('n', '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save file' })
vim.keymap.set('i', '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save file' })
vim.keymap.set('n', '<leader>gg', vim.cmd.LazyGit, { desc = 'lazygit' })

return {

  { 'nvim-neotest/neotest-plenary' },
  {
    'codota/tabnine-nvim',
    build = './dl_binaries.sh',
    lazy = false,
    config = function()
      require('tabnine').setup {
        disable_auto_comment = true,
        accept_keymap = '<C-g>',
        dismiss_keymap = '<C-]>',
        debounce_ms = 800,
        suggestion_color = { gui = '#808080', cterm = 244 },
        codelens_color = { gui = '#808080', cterm = 244 },
        codelens_enabled = true,
        exclude_filetypes = { 'TelescopePrompt', 'NvimTree' },
        log_file_path = nil,
        -- log_file_path = "./log/",
      }
    end,
  },
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
