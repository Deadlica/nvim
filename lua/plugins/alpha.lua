return {
  'goolord/alpha-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },

  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.startify'
    local headers = require 'plugins.headers.ascii'

    dashboard.section.header.val = headers.code

    alpha.setup(dashboard.opts)
  end,
}
