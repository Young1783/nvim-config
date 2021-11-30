require("nvim-treesitter.install").prefer_git = true
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"java", "c", "bash", "cmake", "comment", "commonlisp", "cpp", "css",
  "elm", "fish","go", "graphql", "html", "javascript", "jsdoc", "json", "json5", "julia",
  "kotlin", "lua", "php", "python", "regex", "rst", "ruby", "rust", "scss", "toml", "tsx",
  "typescript", "vim", "vue", "yaml"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    additional_vim_regex_highlighting = false,
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
  },
}

