require'nvim-treesitter.configs'.setup {
  ensure_installed = { "bash", "sql", "json", "json5", "java", "typescript", "javascript", "python", "c", "lua", "vim", "vimdoc", "query" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
