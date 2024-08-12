return {
  {
    'folke/trouble.nvim',
    tag = 'v3.6.0',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    cmd = { 'TroubleToggle', 'Trouble' },
    config = function()
      require('trouble').setup {
        modes = {
          diagnostics_buffer = {
            mode = 'diagnostics',
            filter = { buf = 0 },
          },
          cascade = {
            mode = 'diagnostics',
            filter = function(items)
              local severity = vim.diagnostic.severity.HINT
              for _, item in ipairs(items) do
                severity = math.min(severity, item.severity)
              end
              return vim.tbl_filter(function(item)
                return item.severity == severity
              end, items)
            end,
          },
        },
      }
    end,
  },
}
