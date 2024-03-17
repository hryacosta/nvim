return {
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
}
