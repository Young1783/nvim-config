return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use "kdav5758/TrueZen.nvim"
  use 'yamatsum/nvim-cursorline'
  use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons'}
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
  }
  use {
  'glepnir/galaxyline.nvim',
    branch = 'main',
    -- your statusline
    config = function() require'my_statusline' end,
    -- config = function() require'spaceline' end,
    -- some optional icons
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  -- use {'datwaft/bubbly.nvim', config = function()
  --   -- Here you can add the configuration for the plugin
  --   vim.g.bubbly_palette = {
  --     background = "#34343c",
  --     foreground = "#c5cdd9",
  --     black = "#3e4249",
  --     red = "#ec7279",
  --     green = "#a0c980",
  --     yellow = "#deb974",
  --     blue = "#6cb6eb",
  --     purple = "#d38aea",
  --     cyan = "#5dbbc1",
  --     white = "#c5cdd9",
  --     lightgrey = "#57595e",
  --     darkgrey = "#404247",
  --   }
  --   vim.g.bubbly_statusline = {
  --       'mode',
  --       -- 'truncate',
  --       'path',
  --       --'branch',
  --       'signify',
  --       'coc',
  --       'divisor',
  --       'filetype',
  --       'progress',
  --   }
  --   vim.g.bubbly_tabline = 0
  --   vim.g.bubbly_inactive_color = { background = 'lightgrey', foreground = 'foreground' }
  --   vim.g.bubbly_tags = {
  --       default = 'HELP ME PLEASE!',
  --       mode = {
  --           normal = 'N',
  --           insert = 'I',
  --           visual = 'V',
  --           visualblock = 'VISUAL-B',
  --           command = 'C',
  --           terminal = 'Z',
  --           replace = 'R',
  --           default = 'X',
  --       },
  --       paste = 'PASTE',
  --       filetype = {
  --       noft = 'no ft',
  --       },
  --       }
  -- end}
end)
