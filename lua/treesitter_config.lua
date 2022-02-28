require("nvim-treesitter.install").prefer_git = true
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"java", "c", "bash", "cmake", "comment", "commonlisp", "cpp", "css", "lua",
  "fish","html", "javascript", "json", "json5", "regex", "ruby", "scss", "tsx", "typescript", "vim", "vue", "yaml"},
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    additional_vim_regex_highlighting = false,
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
  },
}

