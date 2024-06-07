return {
  { 'nvim-neotest/neotest-plenary' },
  {
    'nvim-neotest/neotest',
    lazy = false,
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      {
        'nvim-neotest/neotest-jest',
        -- commit = 'c2118446d770fedb360a91b1d91a7025db86d4f1',
      },
      'sidlatau/neotest-dart',
      'rcasia/neotest-java',
      'rouge8/neotest-rust',
    },
    opts = {
      adapters = { 'neotest-plenary' },
      status = { virtual_text = true },
      output = { open_on_run = true },
      -- quickfix = {
      --   open = function()
      --     -- require("trouble").open { mode = "quickfix", focus = false }
      --   end,
      -- },
    },
    config = function(_, opts)
      -- local neotest_ns = vim.api.nvim_create_namespace 'neotest'
      -- vim.diagnostic.config({
      --   virtual_text = {
      --     format = function(diagnostic)
      --       -- Replace newline and tab characters with space for more compact diagnostics
      --       local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
      --       return message
      --     end,
      --   },
      -- }, neotest_ns)
      opts.consumers = opts.consumers or {}
      opts.consumers.trouble = function(client)
        client.listeners.results = function(adapter_id, results, partial)
          if partial then
            return
          end
          local tree = assert(client:get_position(nil, { adapter = adapter_id }))

          local failed = 0
          for pos_id, result in pairs(results) do
            if result.status == 'failed' and tree:get_key(pos_id) then
              failed = failed + 1
            end
          end
          vim.schedule(function()
            local trouble = require 'trouble'
            if trouble.is_open() then
              trouble.refresh()
              if failed == 0 then
                trouble.close()
              end
            end
          end)
          return {}
        end
      end
      opts.adapters = {
        require 'neotest-jest' {
          discovery = {
            enabled = false,
          },
          jestCommand = 'npx jest --coverage --maxWorkers=2 --forceExit',
          -- jestConfigFile = "jest.config.js",
          -- env = { CI = true },
          -- cwd = function(path)
          --   return vim.fn.getcwd()
          -- end,
          -- jestConfigFile = function()
          --   local file = vim.fn.expand '%:p'
          --   if string.find(file, '/packages/') then
          --     return string.match(file, '(.-/[^/]+/)src') .. 'jest.config.ts'
          --   end
          --
          --   return vim.fn.getcwd() .. '/jest.config.ts'
          -- end,
          jestConfigFile = function(file)
            if string.find(file, '/packages/') then
              return string.match(file, '(.-/[^/]+/)src') .. 'jest.config.ts'
            end

            return vim.fn.getcwd() .. '/jest.config.ts'
          end,
          env = { CI = true },
          cwd = function(path)
            return vim.fn.getcwd()
          end,
        },

        require 'neotest-dart' {
          command = 'flutter', -- Command being used to run tests. Defaults to `flutter`
          -- Change it to `fvm flutter` if using FVM
          -- change it to `dart` for Dart only tests
          use_lsp = true, -- When set Flutter outline information is used when constructing test name.
          -- Useful when using custom test names with @isTest annotation
          custom_test_method_names = {},
        },
        require 'neotest-java' {
          ignore_wrapper = false,
        },
        require 'neotest-rust' {
          args = { '--no-capture' },
          dap_adapter = 'lldb',
        },
      }

      require('neotest').setup(opts)
    end,
    keys = {
      {
        '<leader>tt',
        function()
          local neotest = require 'neotest'
          neotest.run.run(vim.fn.expand '%')
        end,
        desc = 'Run File',
      },
      {
        '<leader>td',
        function()
          local neotest = require 'neotest'
          neotest.run.run { strategy = 'dap' }
        end,
        desc = 'Debug File',
      },
      {
        '<leader>tT',
        function()
          local neotest = require 'neotest'
          neotest.run.run(vim.loop.cwd())
        end,
        desc = 'Run All Test Files',
      },
      {
        '<leader>tr',
        function()
          local neotest = require 'neotest'
          neotest.run.run()
        end,
        desc = 'Run Nearest',
      },
      {
        '<leader>ts',
        function()
          local neotest = require 'neotest'
          neotest.summary.toggle()
        end,
        desc = 'Toggle Summary',
      },
      {
        '<leader>to',
        function()
          local neotest = require 'neotest'
          neotest.output.open { enter = true, auto_close = true }
        end,
        desc = 'Show Output',
      },
      {
        '<leader>tO',
        function()
          local neotest = require 'neotest'
          neotest.output_panel.toggle()
        end,
        desc = 'Toggle Output Panel',
      },
      {
        '<leader>tS',
        function()
          local neotest = require 'neotest'
          neotest.run.stop()
        end,
        desc = 'Stop',
      },
      { '<leader>tR', '<cmd>CoverageSummary<cr>', desc = 'coverage summary' },
      { '<leader>tC', '<cmd>Coverage<cr>', desc = 'coverage' },
    },
  },
  {
    'folke/neodev.nvim',
    lazy = false,
    opts = {
      library = {
        enabled = true, -- when not enabled, neodev will not change any settings to the LSP server
        -- these settings will be used for your Neovim config directory
        runtime = true, -- runtime path
        types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
        plugins = true, -- installed opt or start plugins in packpath
        -- you can also specify the list of plugins to make available as a workspace library
        -- plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
        setup_jsonls = true, -- configures jsonls to provide completion for project specific .luarc.json files
        -- for your Neovim config directory, the config.library settings will be used as is
        -- for plugin directories (root_dirs having a /lua directory), config.library.plugins will be disabled
        -- for any other directory, config.library.enabled will be set to false
        override = function(root_dir, options) end,
        -- With lspconfig, Neodev will automatically setup your lua-language-server
        -- If you disable this, then you have to set {before_init=require("neodev.lsp").before_init}
        -- in your lsp start options
        lspconfig = true,
        -- much faster, but needs a recent built of lua-language-server
        -- needs lua-language-server >= 3.6.0
        pathStrict = true,
      },
    },
    config = function(opts)
      require('neodev').setup(opts)
    end,
  },
}
