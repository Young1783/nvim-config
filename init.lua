
--Prepare{{{
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

-- update config with the latest init.lua
vim.api.nvim_exec(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]],
  false
)

--}}}

--Plugins{{{
-- local use = require('packer').use
local packer = nil
if packer == nil then
  packer = require 'packer'
  local util = require 'packer.util'
  packer.init {
    ensure_dependencies   = true, -- Should packer install plugin dependencies?
    package_root   = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack'),
    compile_path = util.join_paths(vim.fn.stdpath('config'), 'plugin', 'packer_compiled.lua'),
    plugin_package = 'packer', -- The default package for plugins
    max_jobs = nil, -- Limit the number of simultaneous jobs. nil means no limit
    auto_clean = true, -- During sync(), remove unused plugins
    compile_on_sync = true, -- During sync(), run packer.compile()
    disable_commands = false, -- Disable creating commands
    opt_default = false, -- Default to using opt (as opposed to start) plugins
    transitive_opt = true, -- Make dependencies of opt plugins also opt by default
    transitive_disable = true, -- Automatically disable dependencies of disabled plugins
    auto_reload_compiled = true, -- Automatically reload the compiled file after creating it.
    git = {
      cmd = 'git', -- The base command for git operations
      subcommands = { -- Format strings for git subcommands
        update         = 'pull --ff-only --progress --rebase=false',
        install        = 'clone --depth %i --no-single-branch --progress',
        fetch          = 'fetch --depth 999999 --progress',
        checkout       = 'checkout %s --',
        update_branch  = 'merge --ff-only @{u}',
        current_branch = 'branch --show-current',
        diff           = 'log --color=never --pretty=format:FMT --no-show-signature HEAD@{1}...HEAD',
        diff_fmt       = '%%h %%s (%%cr)',
        get_rev        = 'rev-parse --short HEAD',
        get_msg        = 'log --color=never --pretty=format:FMT --no-show-signature HEAD -n 1',
        submodules     = 'submodule update --init --recursive --progress'
      },
      depth = 1, -- Git clone depth
      clone_timeout = 60000, -- Timeout, in seconds, for git clones
      default_url_format = 'https://github.com/%s' -- Lua format string used for "aaa/bbb" style plugins
    },
    display = {
      non_interactive = false, -- If true, disable display windows for all operations
      open_fn  = nil, -- An optional function to open a window for packer's display
      open_cmd = '65vnew \\[packer\\]', -- An optional command to open a window for packer's display
      working_sym = '⟳', -- The symbol for a plugin being installed/updated
      error_sym = '✗', -- The symbol for a plugin with an error in installation/updating
      done_sym = '✓', -- The symbol for a plugin which has completed installation/updating
      removed_sym = '-', -- The symbol for an unused plugin which was removed
      moved_sym = '→', -- The symbol for a plugin which was moved (e.g. from opt to start)
      header_sym = '━', -- The symbol for the header line in packer's display
      show_all_info = true, -- Should packer show all update details automatically?
      prompt_border = 'double', -- Border style of prompt popups.
      keybindings = { -- Keybindings for the display window
        quit = 'q',
        toggle_info = '<CR>',
        diff = 'd',
        prompt_revert = 'r',
      }
    },
    luarocks = {
      python_cmd = 'python' -- Set the python command to use for running hererocks
    },
    log = { level = 'warn' }, -- The default print log level. One of: "trace", "debug", "info", "warn", "error", "fatal".
    profile = {
      enable = false,
      threshold = 1, -- integer in milliseconds, plugins which load faster than this won't be shown in profile output
    }
  }
end
--require('packer').startup(function()
packer.startup(function()
  use 'wbthomason/packer.nvim' -- Package manager
  use {'ripxorip/aerojump.nvim', run = ':UpdateRemotePlugins'}
  use 'glepnir/dashboard-nvim'
  use {'marko-cerovac/material.nvim', branch = 'no-async'}
  use {'rrethy/vim-hexokinase', run = 'make hexokinase'}
  use 'neovim/nvim-lspconfig'
  use 'markstory/vim-zoomwin'
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'nvim-treesitter/nvim-treesitter-refactor'
  use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'}
  use 'yegappan/mru'
  use 'simnalamburt/vim-mundo'
  use 'jszakmeister/vim-togglecursor'
  use 'calebsmith/vim-lambdify'
  use {'nvim-orgmode/orgmode',
    config = function()
      require('orgmode').setup({
          -- org_agenda_files = {'~/Dropbox/org/*', '~/my-orgs/**/*'},
          org_default_notes_file = '~/.local/refile.org',
        })
    end
  }
  -- use {'neoclide/coc.nvim', branch = 'release'}
  -- use 'rafcamlet/coc-nvim-lua'
  -- use 'neovim/nvim-lspconfig'
  use 'tpope/vim-fugitive'
  use 'junegunn/vim-easy-align'
  use 'mhinz/vim-signify'
  use 'psliwka/vim-smoothie'
  use 'preservim/tagbar'
  use {'Yggdroot/LeaderF', run = ':LeaderfInstallCExtension'}
  use "folke/which-key.nvim"
  use 'jiangmiao/auto-pairs'
  use 'voldikss/vim-floaterm'
  use 'romainl/vim-cool'
  use 'luochen1990/rainbow'
  use 'honza/vim-snippets'
  --use 'SirVer/ultisnips'
  use 'tyru/caw.vim'
  use 'preservim/nerdcommenter'
  use 't9md/vim-choosewin'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'andymass/vim-matchup'
  use 'sheerun/vim-polyglot'
  use 'junegunn/fzf.vim'
  -- use 'vn-ki/coc-clap'
  use {'liuchengxu/vim-clap', run = ':Clap install-binary!'}
  use 'godlygeek/tabular'
  use 'plasticboy/vim-markdown'
  -- use 'lervag/vimtex'
  use 'liuchengxu/vista.vim'
  use 'neomake/neomake'
  use "kdav5758/TrueZen.nvim"
  use 'yamatsum/nvim-cursorline'
  use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons'}
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
  }
  use 'nvim-telescope/telescope-project.nvim'
  use {'tom-anders/telescope-vim-bookmarks.nvim',
    requires = {{'MattesGroeger/vim-bookmarks'}}
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
end)
--}}}

--Global Setting{{{
vim.o.hidden = true
vim.o.mouse = 'a'
vim.o.termguicolors = true
vim.o.compatible = false
vim.o.foldmethod = 'marker'
vim.o.clipboard = 'unnamed'
vim.o.ignorecase = true
vim.o.hidden = true
-- if vim.fn.has("persistent_undo") == 1 then
--   vim.o.undodir='$HOME/.config/nvim/files/undo'
--   vim.o.undofile = true
-- end

vim.o.relativenumber = true
vim.o.number = true
vim.o.cmdheight = 2
vim.o.wildmenu = true
vim.o.wildmode = 'longest,full'
vim.o.backspace = 'indent,eol,start'
vim.o.showmode = true
vim.o.showcmd = true
vim.o.encoding = 'utf-8'
vim.o.fileencoding = 'utf-8'
vim.o.fileencodings = 'utf-8'
vim.o.fileformat = 'unix'
vim.o.fillchars = 'eob: '
vim.cmd[[syntax on]]
vim.o.expandtab = true
vim.cmd[[filetype plugin indent on]]
vim.o.errorbells = false
vim.o.laststatus = 2
vim.o.cursorline = true
vim.o.wrap = true
vim.o.linebreak = false
vim.o.scrolloff = 5
vim.o.showmatch = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.backup = false
vim.o.swapfile = false
vim.o.autochdir = false
vim.o.history = 1000
vim.o.updatetime = 100
vim.o.timeoutlen = 500
vim.o.autoread = true
vim.o.completeopt = 'menu,noinsert'
vim.o.list = true
vim.o.confirm = true
vim.o.shortmess='c'
vim.o.listchars = 'tab:→ ,eol:↲,trail:·,extends:⟩,precedes:⟨'
vim.o.showbreak = '↪ '
vim.o.rtp = vim.o.rtp .. "/opt/homebrew/opt/fzf"

vim.g.material_style = 'deep ocean'
vim.g.material_italic_comments = true
vim.g.material_italic_keywords = true
vim.g.material_italic_functions = true
vim.g.material_italic_variables = false
vim.g.material_contrast = true
vim.g.material_borders = false
vim.g.material_disable_background = false

--vim.cmd [[colorscheme material]]
require('material').set()


--}}}

--nvim prog path{{{
--vim.g.python_host_prog="/Users/evan/dev/miniconda/envs/python2_7/bin/python"
vim.g.loaded_python_provider = 0
-- vim.g.python3_host_prog="/opt/homebrew/bin/python3"
-- vim.g.loaded_python3_provider = 1

vim.g.loaded_perl_provider = 0
vim.g.ruby_host_prog ="/opt/homebrew/lib/ruby/gems/3.0.0/bin/neovim-ruby-host"
--}}}

--Dashboard{{{
vim.g.dashboard_default_executive ='telescope'
vim.g.dashboard_session_directory = '~/.cache/nvim/session'
vim.g.dashboard_custom_footer = {'Design By Evan'}
vim.g.dashboard_custom_header = {
      '████████████████████████████████████████████████████████████████████████████',
      '█▄─▄▄─█▄─▄▄▀█▄─▄█▄─▄▄▀█▄─▄▄─███▄─▄▄▀██▀▄─██▄─▄█▄─▀█▄─▄█▄─▄─▀█─▄▄─█▄─█▀▀▀█─▄█',
      '██─▄▄▄██─▄─▄██─███─██─██─▄█▀████─▄─▄██─▀─███─███─█▄▀─███─▄─▀█─██─██─█─█─█─██',
      '▀▄▄▄▀▀▀▄▄▀▄▄▀▄▄▄▀▄▄▄▄▀▀▄▄▄▄▄▀▀▀▄▄▀▄▄▀▄▄▀▄▄▀▄▄▄▀▄▄▄▀▀▄▄▀▄▄▄▄▀▀▄▄▄▄▀▀▄▄▄▀▄▄▄▀▀',
      '                                                                            ',
      '                                  LOVE NVIM                                 '
}
vim.g.dashboard_custom_section = {
  find_history = {
    description = {'  Search History                              '},
    command = 'Telescope oldfiles'
  },
  project_list= {
    description = {'  Open Projects                              '},
    command = 'Telescope project'
  },
  find_files = {
    description = { "  Find a file in the current directory        " },
    command = "Telescope find_files",
},
}
vim.api.nvim_exec(
  [[
  autocmd User dashboardReady let &l:laststatus = 0 | autocmd WinLeave <buffer> set laststatus=2
  autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2
  ]],
  false
  )

--}}}

--Hexokinase{{{
vim.g.Hexokinase_highlighters = {'virtual'}
vim.g.Hexokinase_virtualText = ''
vim.g.Hexokinase_termDisabled = 1
--}}}

--vista{{{
vim.g.vista_icon_indent = {"╰─▸ ", "├─▸ "}
vim.g.vista_default_executive = 'ctags'
vim.g.vista_fzf_preview = {'right:50%'}
vim.g['vista#renderer#enable_icon'] = 1
vim.api.nvim_exec([[
let g:vista#renderer#icons = {"function": "\uf794","variable": "\\uf71b"}
]],
  false)
--}}}

--Nerdcomment{{{
vim.g.NERDCreateDefaultMappings = 1
vim.g.NERDSpaceDelims = 1
vim.g.NERDCompactSexyComs = 1
vim.g.NERDDefaultAlign = 'left'
vim.g.NERDCommentEmptyLines = 1
vim.g.NERDTrimTrailingWhitespace = 1
vim.g.NERDToggleCheckAllLines = 1

--}}}

--floaterm{{{
vim.g.floaterm_keymap_toggle = '<F12>'
vim.g.floaterm_keymap_new    = '<F11>'

--}}}

--tagbar{{{
vim.g.tagbar_autofocus=1
vim.g.tagbar_ctags_bin ='/opt/homebrew/bin/ctags'
vim.g.tagbar_use_cache = 0
--}}}

--Neomake{{{
vim.g.neomake_enabled_makers = {'gradle'}
vim.g.neomake_logfile = '/tmp/neomake.log'
--}}}

--vimtex{{{
vim.g.vimtex_syntax_conceal_default=0
vim.g.vimtex_toc_config = {
  name= "ToC",
  indent_levels= 1,
  split_width= 40
}
vim.g.vimtex_compiler_progname = 'nvr'
vim.g.tex_flavor = 'latex'
vim.g.vimtex_delim_list = {
  delim_tex = {
    name = {
      {'[', ']'},
      {'{', '}'}
    }
  }
}

vim.g.vimtex_delim_toggle_mod_list = {
  {'\\bigl', '\\bigr'},
  {'\\Bigl', '\\Bigr'},
  {'\\biggl', '\\biggr'},
  {'\\Biggl', '\\Biggr'},
  {'[', ')'},
  
}

--}}}

--LeaderF{{{
vim.g.Lf_WindowPosition = 'popup'
vim.g.Lf_ShowDevIcons = 1
vim.g.Lf_PreviewInPopup = 1
vim.g.Lf_ShortcutF = "<leader>ff"
vim.g.Lf_ShortcutB = "<leader>fb"
--}}}

--COC{{{
-- vim.g.coc_global_extensions = {
--   'coc-json', 'coc-pyright',
--   'coc-floaterm','coc-tsserver',
--   'coc-angular','coc-sh',
--   'coc-vimtex','coc-vimlsp',
--   'coc-explorer', 'coc-java',
--   'coc-snippets', 'coc-pairs'
-- }
-- vim.g.coc_start_at_startup = 0
-- vim.g.coc_config_home = '/Users/evan/.config/nvim/configurations'
-- vim.g.coc_snippet_next = '<tab>'
-- vim.api.nvim_exec([[
--   autocmd VimLeavePre * :call coc#rpc#kill()
--   autocmd FileType kotlin let b:coc_root_patterns=['.git', '.env']
--     ]],
--     false
--     )

--}}}

--matchup{{{
vim.g.matchup_matchparen_offscreen = {method= 'popup'}

--}}}

--bracket{{{
vim.g.rainbow_active = 1
vim.g.rainbow_conf = {
  separately = {
    nerdtree = 0
  }
}
--}}}

--choosewin{{{
vim.g.choosewin_overlay_enable = 1

--}}}

--nvimtree{{{


-- vim.g.nvim_tree_side = 'left' --left by default
-- vim.g.nvim_tree_width = 40 --30 by default
-- vim.g.nvim_tree_ignore = { '.git', 'node_modules', '.cache' }  -- empty by default
-- vim.g.nvim_tree_gitignore = 0 --0 by default
-- vim.g.nvim_tree_auto_open = 0 --0 by default, opens the tree when typing `vim $DIR` or `vim`
-- vim.g.nvim_tree_auto_close = 1 --0 by default, closes the tree when it's the last window
-- vim.g.nvim_tree_auto_ignore_ft = { 'startify', 'dashboard' } --empty by default, don't auto open tree on specific filetypes.
-- vim.g.nvim_tree_quit_on_open = 0 --0 by default, closes the tree when you open a file
-- vim.g.nvim_tree_follow = 1 --0 by default, this option allows the cursor to be updated when entering a buffer
-- vim.g.nvim_tree_indent_markers = 0 --0 by default, this option shows indent markers when folders are open
-- vim.g.nvim_tree_hide_dotfiles = 1 --0 by default, this option hides files and folders starting with a dot `.`
-- vim.g.nvim_tree_git_hl = 1 --0 by default, will enable file highlight for git attributes (can be used without the icons).
-- vim.g.nvim_tree_root_folder_modifier = ':~' --This is the default. See :help filename-modifiers for more options
-- vim.g.nvim_tree_tab_open = 0 --0 by default, will open the tree when entering a new tab and the tree was previously open
-- vim.g.nvim_tree_width_allow_resize  = 1 --0 by default, will not resize the tree when opening a file
-- vim.g.nvim_tree_disable_netrw = 1 --1 by default, disables netrw
-- vim.g.nvim_tree_hijack_netrw = 1 --1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
-- vim.g.nvim_tree_add_trailing = 0 --0 by default, append a trailing slash to folder names
-- vim.g.nvim_tree_group_empty = 1 -- 0 by default, compact folders that only contain a single folder into one node in the file tree
-- vim.g.nvim_tree_lsp_diagnostics = 1 --0 by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics
-- vim.g.nvim_tree_special_files = { 'README.md', 'Makefile', 'MAKEFILE' } -- List of filenames that gets highlighted with NvimTreeSpecialFile
-- vim.g.nvim_tree_show_icons = {
--   git= 1,
--   folders= 1,
--   files= 1,
-- }
-- --If 0, do not show the icons for one of 'git' 'folder' and 'files'
-- --1 by default, notice that if 'files' is 1, it will only display
-- --if nvim-web-devicons is installed and on your runtimepath
--
-- vim.g.nvim_tree_icons = {
--   default= '',
--   symlink= '',
--   git= {
--     unstaged= "✗",
--     staged= "✓",
--     unmerged= "",
--     renamed= "➜",
--     untracked= "★",
--     deleted= "",
--     ignored= "◌"
--   },
--   folder= {
--     default= "",
--     open= "",
--     empty= "",
--     empty_open= "",
--     symlink= "",
--     symlink_open= "",
--   },
--   lsp= {
--     hint= "",
--     info= "",
--     warning= "",
--     error= "",
--   }
-- }

vim.g.nvim_tree_quit_on_open = 1 --0 by default, closes the tree when you open a file
vim.g.nvim_tree_indent_markers = 1 --0 by default, this option shows indent markers when folders are open
vim.g.nvim_tree_git_hl = 1 --0 by default, will enable file highlight for git attributes (can be used without the icons).
vim.g.nvim_tree_highlight_opened_files = 1 --"0 by default, will enable folder and file icon highlight for opened files/directories.
vim.g.nvim_tree_root_folder_modifier = ':~' --"This is the default. See :help filename-modifiers for more options
vim.g.nvim_tree_add_trailing = 1 --"0 by default, append a trailing slash to folder names
vim.g.nvim_tree_group_empty = 1 --" 0 by default, compact folders that only contain a single folder into one node in the file tree
vim.g.nvim_tree_disable_window_picker = 1 --"0 by default, will disable the window picker.
vim.g.nvim_tree_icon_padding = ' ' --"one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
-- vim.g.nvim_tree_symlink_arrow = ' >> ' --" defaults to ' ➛ '. used as a separator between symlinks' source and target.
vim.g.nvim_tree_respect_buf_cwd = 1 --"0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
vim.g.nvim_tree_create_in_closed_folder = 0 --"1 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
vim.g.nvim_tree_refresh_wait = 500 --"1000 by default, control how often the tree can be refreshed, 1000 means the tree can be refresh once per 1000ms.
vim.g.nvim_tree_window_picker_exclude = {
  filetype= {
    'notify',
    'packer',
    'qf'
  },
  buftype= {
    'terminal'
  }
}
--" Dictionary of buffer option names mapped to a list of option values that
--" indicates to the window picker that the buffer's window should not be
--" selectable.
vim.g.nvim_tree_special_files = { 'README.md', 'Makefile', 'MAKEFILE' } --" List of filenames that gets highlighted with NvimTreeSpecialFile
vim.g.nvim_tree_show_icons = {
  git= 1,
  folders= 1,
  files= 1,
  folder_arrows= 1,
}
--"If 0, do not show the icons for one of 'git' 'folder' and 'files'
--"1 by default, notice that if 'files' is 1, it will only display
--"if nvim-web-devicons is installed and on your runtimepath.
--"if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
--"but this will not work when you set indent_markers (because of UI conflict)

--" default will show icon by default if no icon is provided
--" default shows no icon by default
vim.g.nvim_tree_icons = {
  default= '',
  symlink= '',
  git= {
    unstaged= "✗",
    staged= "✓",
    unmerged= "",
    renamed= "➜",
    untracked= "★",
    deleted= "",
    ignored= "◌"
  },
  folder= {
    arrow_open= "",
    arrow_closed= "",
    default= "",
    open= "",
    empty= "",
    empty_open= "",
    symlink= "",
    symlink_open= "",
  }
}

vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>',  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>r', ':NvimTreeRefresh<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>n', ':NvimTreeFindFile<CR>', {noremap = true, silent = true})



--" a list of groups can be found at `:help nvim_tree_highlight`
vim.cmd [[highlight NvimTreeFolderIcon guibg=blue]]

require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  auto_close          = false,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {}
    }
  }
}






--}}}

--bufferline{{{
local normal_bg = {
  attribute = "bg",
  highlight = "Normal",
}
local comment_fg = {
  attribute = "fg",
  highlight = "Comment",
}
require'bufferline'.setup{
  options = {
    view = "default",-- "multiwindow" | "default",
    numbers = "ordinal",--  "none" | "ordinal" | "buffer_id" | "both",
    --number_style = "", -- "superscript" | "" | { "none", "subscript" }, -- buffer_id at index 1, ordinal at index 2
    -- mappings = true,-- true | false,
    buffer_close_icon= '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is deduplicated
    tab_size = 18,
    diagnostics = false,--  false | "nvim_lsp"
    diagnostics_indicator = function(count, level, diagnostics_dict)
      return "("..count..")"
    end,
    -- NOTE: this will be called a lot so don't do any heavy processing here
    custom_filter = function(buf_number)
      -- filter out filetypes you don't want to see
      if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
        return true
      end
      -- filter out by buffer name
      if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
        return true
      end
      -- filter out based on arbitrary rules
      -- e.g. filter out vim wiki buffer from tabline in your work repo
      if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
        return true
      end
    end,
    show_buffer_close_icons = false,-- true | false,
    show_close_icon = false,-- true | false,
    show_tab_indicators = true,-- true | false,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    separator_style = "thick",--  "slant" | "thick" | "thin" | { 'any', 'any' },
    enforce_regular_tabs = true,-- false | true,
    always_show_bufferline = true,-- true | false,
    -- sort_by = 'extension' | 'relative_directory' | 'directory' | function(buffer_a, buffer_b)
    --   -- add custom logic
    --   return buffer_a.modified > buffer_b.modified
    -- end
  };
  highlights = {
    tab = {
      guifg = {
        attribute = 'fg',
        highlight = 'Normal'
      },
      guibg = {
        attribute = 'bg',
        highlight = 'LineNr'
      }
    },
    tab_selected = {
      guifg = {
        attribute = 'bg',
        highlight = 'TebLineSel'
      },
      guibg = {
        attribute = 'fg',
        highlight = 'TabLineSel',
      },
    },
    buffer_selected = {
      guifg = {
        attribute = 'fg',
        highlight = 'SpecialChar',
      },
      guibg = {
        attribute = 'bg',
        highlight = 'Normal',
      },
      gui = "bold,italic",
    },
    separator_selected = {
      guifg = normal_bg,
      guibg = normal_bg,
    },
    -- separator_visible = {
    --   guifg = separator_background_color,
    --   guibg = visible_bg,
    -- },
    -- separator = {
    --   guifg = comment_fg,
    --   guibg = normal_bg,
    -- },
    fill = {
      guibg = {
        attribute = 'bg',
        highlight = 'Normal'
      },
      guifg = {
        attribute = 'bg',
        highlight = 'Normal'
      },
    },
  },

}
--}}}

--telescope{{{
local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<c-j>"] = actions.move_selection_next,
        ["<c-k>"] = actions.move_selection_previous,
      },
    },
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "In: ",
    selection_caret = " ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      width = 0.75,
      prompt_position = "top",
      preview_cutoff = 60,
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    path_display = {},
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}
require'telescope'.load_extension('project')
require('telescope').load_extension('vim_bookmarks')

--}}}

--truezen{{{
local true_zen = require("true-zen")

-- setup for TrueZen.nvim
true_zen.setup({
    true_false_commands = false,
    cursor_by_mode = false,
    bottom = {
      hidden_laststatus = 0,
      hidden_ruler = false,
      hidden_showmode = false,
      hidden_showcmd = false,
      hidden_cmdheight = 1,

      shown_laststatus = 2,
      shown_ruler = true,
      shown_showmode = false,
      shown_showcmd = false,
      shown_cmdheight = 1
    },
    top = {
      hidden_showtabline = 0,

      shown_showtabline = 2
    },
    left = {
      hidden_number = false,
      hidden_relativenumber = false,
      hidden_signcolumn = "no",

      shown_number = true,
      shown_relativenumber = false,
      shown_signcolumn = "no"
    },
    ataraxis = {
      ideal_writing_area_width = 0,
      just_do_it_for_me = false,
      left_padding = 40,
      right_padding = 40,
      top_padding = 0,
      bottom_padding = 0,
      custome_bg = "",
      disable_bg_configuration = false,
      disable_fillchars_configuration = false,
      force_when_plus_one_window = false,
      force_hide_statusline = true,
      quit_untoggles_ataraxis = false
    },
    focus = {
      margin_of_error = 5,
      focus_method = "experimental"
    },
    minimalist = {
      store_and_restore_settings = false,
      show_vals_to_read = {}
    },
    events = {
      before_minimalist_mode_shown = false,
      before_minimalist_mode_hidden = false,
      after_minimalist_mode_shown = false,
      after_minimalist_mode_hidden = false
    },
    integrations = {
      integration_galaxyline = false,
      integration_vim_airline = false,
      integration_vim_powerline = false,
      integration_tmux = false,
      integration_express_line = false,
      integration_gitgutter = false,
      integration_vim_signify = false,
      integration_limelight = false,
      integration_tzfocus_tzataraxis = false,
      integration_gitsigns = false
    }
  })

--}}}

--treesitter{{{
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.org = {
  install_info = {
    url = 'https://github.com/milisims/tree-sitter-org',
    revision = 'main',
    files = {'src/parser.c', 'src/scanner.cc'},
  },
  filetype = 'org',
}
-- require("nvim-treesitter.install").prefer_git = true
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"java", "c", "bash", "cmake", "comment", "commonlisp", "cpp", "css",
  "elm", "fish","go", "graphql", "html", "javascript", "jsdoc", "json", "json5", "julia",
  "kotlin", "lua", "php", "python", "regex", "rst", "ruby", "rust", "scss", "toml", "tsx",
  "typescript", "vim", "vue", "yaml", "org"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    additional_vim_regex_highlighting = {"org"},
    enable = true,              -- false will disable the whole extension
    -- disable = {"org"},  -- list of language that will be disabled
  },
  refactor = {
    highlight_definitions = { enable = true },
    highlight_current_scope = { enable = true },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr",
      },
    },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "gnd",
        list_definitions = "gnD",
        list_definitions_toc = "gO",
        goto_next_usage = "<a-*>",
        goto_previous_usage = "<a-#>",
      },
    },
  },
}
--}}}

--markdown{{{
vim.g.vim_markdown_conceal = 0
vim.g.vim_markdown_conceal_code_blocks = 0
vim.g.vim_markdown_folding_disabled = 1

--}}}

--Highlight{{{
vim.cmd [[hi! link DashboardHeader Boolean]]
vim.cmd [[hi SpecialChar gui=bold,italic]]
vim.cmd [[hi! link Folded SpecialChar]]
vim.cmd [[hi! link VertSplit SpecialChar]]

vim.api.nvim_exec([[
highlight FloatermBorder guifg=orange
"highlight Floaterm ctermbg=black guibg=black
"let g:floaterm_background = '#000000'
hi def link FloatermNF        Floaterm
hi def link FloatermNC        Floaterm
hi def link FloatermBorderNF  FloatermBorder
hi def link Whitespace        SpecialKey
hi! def link WhichKeySeperator SpecialKey
" highlight def link DashboardFooter Special
highlight DashboardFooter gui=italic
highlight Comment gui=italic
" highlight StatusLineNC ctermbg=NONE cterm=NONE ctermfg=NONE gui=NONE guibg=NONE guifg=NONE
highlight StatusLineNC ctermbg=NONE cterm=NONE gui=NONE guibg=NONE
  ]],
  false)

--}}}

--which-key{{{

--Remap space as leader key
-- vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

require("which-key").setup {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    ["<space>"] = "SPC",
    ["<cr>"] = "RET",
    ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  window = {
    border = "single", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 2, 2, 2 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "center", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local wk = require("which-key")
wk.register({
    ['<leader>'] = {
      a = {
        name = "Aerojump",
        s = {"<Plug>(AerojumpSpace)", "AerojumpSpace"},
        b = {"<Plug>(AerojumpBolt)", "AerojumpBolt"},
        a = {"<Plug>(AerojumpFromCursorBolt)", "AerojumpFromCursorBolt"},
        d = {"<Plug>(AerojumpDefault)", "AerojumpDefault"},
      },
      f = {
        name = 'LeaderF',
        c = {'<cmd>Leaderf command<CR>', 'Command'},

      },
      t = {
        name = 'Telescope',
        [' '] = {[[<cmd>lua require('telescope.builtin').buffers()<CR>]], 'Buffers'},
        f = {[[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]], 'find files'},
        b = {[[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], 'search'},
        h = {[[<cmd>lua require('telescope.builtin').help_tags()<CR>]], 'help tags'},
        t = {[[<cmd>lua require('telescope.builtin').tags()<CR>]], 'tags'},
        d = {[[<cmd>lua require('telescope.builtin').grep_string()<CR>]], 'grep string'},
        p = {[[<cmd>lua require('telescope.builtin').live_grep()<CR>]], 'live grep'},
        o = {[[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]], 'tags in this buffer'},
        ['?'] = {[[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], 'old files'},
      },
    },
    ['<localleader>'] = {
      b = {
        name = 'Bufferline Operations',
        c = {':bdelete<CR>', 'Close the buffer'},
        n = {':BufferLineCycleNext<CR>', 'next buffer'},
      },
    },
  })

--}}}

--keymap{{{
-- Bash like keys for the command line

vim.api.nvim_set_keymap('c', '<C-A>', '<Home>', {})
vim.api.nvim_set_keymap('c', '<C-E>', '<End>', {})
vim.api.nvim_set_keymap('n', '<F10>', ':Dashboard<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F8>', ':TagbarToggle<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '-', '<Plug>(choosewin)', {})
--Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })
-- Y yank until the end of line
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true })

--}}}

--Indent_blankline{{{
--Map blankline
vim.g.indent_blankline_char = '┃'
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer', 'dashboard' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
vim.g.indent_blankline_char_highlight = 'LineNr'
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_char_highlight_list = {
  'Constant',
  'Character',
  'SpecialKey',
	'Function',
}

require('indent_blankline').setup{

}

--}}}

--{{{
require'lspconfig'.java_language_server.setup{}

--}}}



