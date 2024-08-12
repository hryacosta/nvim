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
    '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
    desc = 'Buffer Diagnostics (Trouble)',
  },
  {
    '<leader>xw',
    '<cmd>Trouble diagnostics toggle<cr>',
    desc = 'Diagnostics (Trouble)',
  },
  {
    '<leader>xs',
    '<cmd>Trouble symbols toggle focus=false<cr>',
    desc = 'Symbols (Trouble)',
  },
  {
    '<leader>xl',
    '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
    desc = 'LSP Definitions / references / ... (Trouble)',
  },
  {
    '<leader>xl',
    '<cmd>Trouble loclist toggle<cr>',
    desc = 'Location List (Trouble)',
  },
  {
    '<leader>xq',
    '<cmd>Trouble qflist toggle<cr>',
    desc = 'Quickfix List (Trouble)',
  },

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
vim.opt.spell = true
vim.opt.spelllang = 'en_us'

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  callback = function(args)
    require('conform').format { bufnr = args.buf }
  end,
})

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
