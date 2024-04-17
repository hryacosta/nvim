return {
  {
    'Redoxahmii/json-to-types.nvim',
    build = 'sh install.sh npm',
    keys = {
      {
        '<leader>cu',
        '<CMD>ConvertJSONtoTS<CR>',
        desc = 'Convert JSON to TS',
      },
      {
        '<leader>ct',
        '<CMD>ConvertJSONtoTSBuffer<CR>',
        desc = 'Convert JSON to TS in buffer',
      },
    },
  },
}
