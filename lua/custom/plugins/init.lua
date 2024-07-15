-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

local wk = require 'which-key'

wk.add {
  { '-', '<cmd>Oil<cr>', desc = 'Open parent directory', mode = 'n', hidden = true },
  { '<leader>k', '<cmd>Neotree source=filesystem toggle<cr>', desc = 'Open Neotree', mode = 'n', hidden = true },

  { '<C-s>', '<cmd>w<cr><esc>', desc = 'Save file', mode = { 'n', 'i', 'v' }, hidden = true },
  -- { '<leader>q', '<cmd>q<cr>', desc = 'Quit' },
  { '<leader>gg', vim.cmd.LazyGit, desc = 'LazyGit', mode = 'n' },
  {
    '<leader>xx',
    function()
      require('trouble').toggle()
    end,
    desc = 'trouble toggle',
    mode = 'n',
  },
  {
    '<leader>xw',
    function()
      require('trouble').toggle 'workspace_diagnostics'
    end,
    desc = 'toggle workspace diagnostics',
    mode = 'n',
  },
  {
    '<leader>xd',
    function()
      require('trouble').toggle 'document_diagnostics'
    end,
    desc = 'toggle document diagnostics',
    mode = 'n',
  },
  {
    '<leader>xq',
    function()
      require('trouble').toggle 'quickfix'
    end,
    desc = 'trouble quickfix',
    mode = 'n',
  },
  {
    '<leader>xl',
    function()
      require('trouble').toggle 'loclist'
    end,
    desc = 'trouble loclist',
    mode = 'n',
  },
  {
    'gR',
    function()
      require('trouble').toggle 'lsp_references'
    end,
    desc = 'trouble lsp references',
    mode = 'n',
  },
  {
    '<leader>ft',
    function()
      require('edgy').toggle 'bottom'
    end,
    desc = 'Open terminal',
    mode = 'n',
  },
}
vim.opt.spell = true
vim.opt.spelllang = { 'en', 'es' }

return {}
