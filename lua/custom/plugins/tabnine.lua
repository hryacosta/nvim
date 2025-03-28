return {
  {
    'codota/tabnine-nvim',
    build = './dl_binaries.sh',
    config = function()
      require('tabnine').setup {
        accept_keymap = '<C-g>',
        dismiss_keymap = '<C-]>',
        disable_auto_comment = true,
        debounce_ms = 800,
        suggestion_color = { gui = '#808080', cterm = 244 },
        exclude_filetypes = { 'TelescopePrompt', 'NvimTree' },
        log_file_path = nil,
        ignore_certificate_errors = false,
        workspace_folders = {
          paths = { '/Users/henryacosta/Proyectos' },
          get_paths = function()
            return { 'mftech-p2p-mobile' }
          end,
        },
      }
    end,
  },
}
