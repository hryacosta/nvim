return {
  {
    'kdheepak/lazygit.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('telescope').load_extension 'lazygit'
    end,
    lazy = false,
  },
  {
    'lewis6991/gitsigns.nvim',
    event = 'User FilePost',
    opts = {
      options = {
        signs = {
          add = { text = '│' },
          change = { text = '│' },
          delete = { text = '󰍵' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
          untracked = { text = '│' },
        },

        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function opts(desc)
            return { buffer = bufnr, desc = desc }
          end

          local map = vim.keymap.set

          map('n', '<leader>rh', gs.reset_hunk, opts 'Reset Hunk')
          map('n', '<leader>ph', gs.preview_hunk, opts 'Preview Hunk')
          map('n', '<leader>gb', gs.blame_line, opts 'Blame Line')
        end,
      },
    },
    config = function(_, opts)
      dofile(vim.g.base46_cache .. 'git')
      require('gitsigns').setup(opts)
    end,
  },
}
