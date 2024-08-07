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
  -- {
  --   '<leader>ft',
  --   function()
  --     require('edgy').toggle 'bottom'
  --   end,
  --   desc = 'Open terminal',
  --   mode = 'n',
  -- },
  { '<leader>l', '<cmd>Lspsaga term_toggle<cr>', desc = '[O]pen [T]erminal', mode = 'n', hidden = true },

  -- { '<leader>e', vim.diagnostic.open_float, desc = 'Show diagnostic [E]rror messages', mode = 'n', hidden = true },
  -- { '<leader>q', vim.diagnostic.setloclist, desc = 'Open diagnostic [Q]uickfix list', mode = 'n', hidden = true },

  {
    '<leader>a',
    function()
      local harpoon = require 'harpoon'
      harpoon:list():append()
    end,
    desc = 'harpoon mark file',
    mode = 'n',
    hidden = true,
  },
  {
    '<C-e>',
    function()
      -- harpoon.toggle_quick_menu()
      local harpoon = require 'harpoon'
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end,
    mode = 'n',
    hidden = true,
  },

  {
    '<leader>b',
    function(opt)
      local dap = require 'dap'
      dap.toggle_breakpoint(opt)
    end,
    desc = 'Debug: Toggle Breakpoint',
    mode = 'n',
    hidden = true,
  },
  {
    '<leader>B',
    function()
      local dap = require 'dap'
      dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end,
    desc = 'Debug: Set Breakpoint',
    mode = 'n',
    hidden = true,
  },
}
-- vim.opt.spell = true
-- vim.opt.spelllang = { 'en', 'es' }

local group = vim.api.nvim_create_augroup('LazygitMods', { clear = true })
vim.api.nvim_create_autocmd('TermEnter', {
  pattern = '*',
  group = group,
  callback = function()
    local name = vim.api.nvim_buf_get_name(0)
    if string.find(name, 'lazygit') then
      vim.keymap.set('t', '<ESC>', function()
        -- Get the terminal job ID for the current buffer
        local bufnr = vim.api.nvim_get_current_buf()
        local chan = vim.b[bufnr].terminal_job_id
        if chan then
          -- Send the ESC key sequence to the terminal
          -- "\x1b" is the escape character
          vim.api.nvim_chan_send(chan, '\x1b')
        end
        --vim.cmd([[call feedkeys("q")]])
      end, { buffer = true })
      return
    end
  end,
})

return {}
