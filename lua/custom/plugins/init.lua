-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
vim.keymap.set('n', '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save file' })
vim.keymap.set('i', '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save file' })
vim.keymap.set('n', '<leader>gg', vim.cmd.LazyGit, { desc = 'lazygit' })
vim.keymap.set('n', '<leader>xx', function()
  require('trouble').toggle()
end, { desc = 'trouble toggle' })
vim.keymap.set('n', '<leader>xw', function()
  require('trouble').toggle 'workspace_diagnostics'
end, { desc = 'toggle workspace diagnostics ' })
vim.keymap.set('n', '<leader>xd', function()
  require('trouble').toggle 'document_diagnostics'
end, { desc = 'trouble document diagnostics' })
vim.keymap.set('n', '<leader>xq', function()
  require('trouble').toggle 'quickfix'
end, { desc = 'trouble quickfix' })
vim.keymap.set('n', '<leader>xl', function()
  require('trouble').toggle 'loclist'
end, { desc = 'trouble loclist' })
vim.keymap.set('n', 'gR', function()
  require('trouble').toggle 'lsp_references'
end, { desc = 'trouble lsp references' })

return {}
