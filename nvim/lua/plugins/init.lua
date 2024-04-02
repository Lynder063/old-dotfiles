return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  { 
    'IogaMaster/neocord',
    event = "VeryLazy"
},

  {
  "lervag/vimtex",
  init = function()
    -- Use init for configuration, don't use the more common "config".
  end
},

  {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      -- config
    }
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
}
